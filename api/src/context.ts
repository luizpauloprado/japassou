import { ApplicationContext } from "./models/application/application-context";
import createService from './services/service-factory';
import GtfsRepository from './repositories/gtfs-repository';

export const context = async ({ req }): Promise<ApplicationContext> => {
  const agency = req.headers.provider;
  const service = createService(agency);
  await service.authenticate();
  
  return {
    req,
    agency,
    providerService: service,
    gtfsDatabase: new GtfsRepository()
  };
}