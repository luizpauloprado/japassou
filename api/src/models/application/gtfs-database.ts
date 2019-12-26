import { Trip } from "../gtfs/trip";
import { Route } from "../gtfs/route";

export interface GtfsDatabase {
  getTrip: (agency: string, tripId: string) => Promise<Trip>;
  getRoute: (agency: string, routeId: string) => Promise<Route>;
}