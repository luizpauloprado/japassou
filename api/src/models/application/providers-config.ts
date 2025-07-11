export interface ProviderConfig {
  config: {
    baseURL: string;
  };
  meta: {
    token: string;
  };
}

export interface ProvidersConfig {
  [key: string]: ProviderConfig;
}

export const providers: ProvidersConfig = {
  sptrans: {
    config: {
      baseURL: 'http://api.olhovivo.sptrans.com.br/v2.1'
    },
    meta: {
      token: 'xxxxxxx'
    }
  }
};
