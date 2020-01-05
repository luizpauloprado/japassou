import { Positions, CurrentPosition } from './../models/services/positions';
import axios, { AxiosInstance } from 'axios';
import { ProviderService } from "../models/application/provider-service";
import { capitalizeWords } from '../utils/text';
import { Line, Direction } from "../models/services/line";
import { ProviderConfig } from "../models/application/providers-config";

class SpTransService implements ProviderService {
  private api: AxiosInstance;
  private providerConfig: ProviderConfig;
  private cookie: string;
  
  constructor(providerConfig: ProviderConfig) {
    this.providerConfig = providerConfig;
    this.api = axios.create(this.providerConfig.config);
  }

  public async authenticate(): Promise<boolean> {
    try {
      const response = await this.api({
        method: 'post',
        url: '/login/autenticar',
        params: {
          token: this.providerConfig.meta.token
        }
      });
      this.cookie = response.headers['set-cookie'];
      return response.data;
    } catch (error) {
      throw new Error('Falied to create SpTransService');
    }
  }

  public async searchLines(description: String): Promise<Line[]> {
    const { data } = await this.api({
      method: 'get',
      url: '/linha/buscar',
      params: {
        termosBusca: description
      },
      withCredentials: true,
      headers: {
        Cookie: this.cookie
      }
    });

    return data.map(toLine) || [];
  }

  public async getLinePosition(lineId: String): Promise<Positions> {
    const { data } = await this.api({
      method: 'get',
      url: '/posicao/linha',
      params: {
        codigoLinha: lineId
      },
      withCredentials: true,
      headers: {
        Cookie: this.cookie
      }
    });

    return toPositions(data);
  }
}

const toLine = (data: any): Line => {
  const direction = data.sl === 1 ? Direction.ToSecondaryTerminal : Direction.ToMainTerminal;
  const mainTerminal = capitalizeWords(data.tp);
  const secondaryTerminal = capitalizeWords(data.ts);
  const routeId = `${data.lt}-${data.tl}`;
  const tripId = `${data.lt}-${data.tl}-${data.sl}`;
  const tripHeadsign = direction === Direction.ToSecondaryTerminal ? 
    `${mainTerminal} > ${secondaryTerminal}` 
    : `${secondaryTerminal} > ${mainTerminal}`;

  return {
    lineId: data.cl,
    directionId: data.sl,
    direction,
    routeId,
    routeHeadsign: routeId,
    tripId,
    tripHeadsign
  };
};

const toPositions = (data: any): Positions => {
  const lastUpdate = data.hr;
  const currentPositions = data.vs.map(toCurrentPosition);

  return {
    lastUpdate,
    currentPositions
  };
}

const toCurrentPosition = (data: any): CurrentPosition => {
  const latitude = data.py;
  const longitude = data.px;

  return {
    latitude,
    longitude
  };
}

export default SpTransService;
