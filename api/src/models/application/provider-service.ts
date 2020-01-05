import { Positions } from './../services/positions';
import { Line } from "../services/line";

export interface ProviderService {
  authenticate: () => Promise<boolean>;
  searchLines: (description: string) => Promise<Line[]>;
  getLinePosition(lineId: String): Promise<Positions>;
}