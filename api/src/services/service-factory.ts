import { ProviderService } from '../models/application/provider-service';
import SpTransService from './sp-trans-service';
import { providers } from '../models/application/providers-config';

const createService = (name: string = 'sptrans'): ProviderService => {
  switch (name) {
    case 'sptrans':
      return new SpTransService(providers[name]);
    default:
      return new SpTransService(providers[name]);
  }
};

export default createService;
