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
      token: '568753ed739d101ca9cde5e5e45ee43ced498b05dc96dc4a307b519078403510'
    }
  }
};
