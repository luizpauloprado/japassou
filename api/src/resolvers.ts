import { Trip } from "./models/gtfs/trip";
import { ApplicationContext } from "./models/application/application-context";

export const resolvers = {
  Query: {
    authenticate: (_, {}, context: ApplicationContext) => 
      context.providerService.authenticate,

    searchLines: (_, { description }, context: ApplicationContext) =>
      context.providerService.searchLines(description),

    getTrip: async (_, { tripId }, context: ApplicationContext) => 
      context.gtfsDatabase.getTrip(context.agency, tripId),
  },
  Trip: {
    route: (parent: Trip, _, context: ApplicationContext) => context.gtfsDatabase.getRoute(context.agency, parent.routeId)
  }
};
