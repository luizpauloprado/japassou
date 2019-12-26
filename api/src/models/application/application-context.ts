import { ProviderService } from './provider-service';
import { GtfsDatabase } from './gtfs-database';

export interface ApplicationContext {
  providerService: ProviderService
  gtfsDatabase: GtfsDatabase,
  agency: string,
  req: any
}