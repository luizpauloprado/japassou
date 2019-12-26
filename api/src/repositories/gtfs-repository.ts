import gtfs from 'gtfs';
import { first } from 'lodash';
import { GtfsDatabase } from '../models/application/gtfs-database';
import { Trip } from '../models/gtfs/trip';
import { Route } from '../models/gtfs/route';

class GtfsRepository implements GtfsDatabase {

  public async getTrip(agency: string, tripId: string): Promise<Trip> {
    try {
      const trips = await gtfs.getTrips({
        agency_key: agency,
        trip_id: tripId
      });

      return toTrip(trips) || null;
    } catch (error) {
      throw new Error('Falied to get trip');
    }
  }

  public async getRoute(agency: string, routeId: string): Promise<Route> {
    try {
      const routes = await gtfs.getRoutes({
        agency_key: agency,
        route_id: routeId
      });

      return toRoute(routes) || null;
    } catch (error) {
      throw new Error('Falied to get trip');
    }
  }

}

const toTrip = (trips: any[]): Trip => {
  const trip = first(trips);
  
  return {
    routeId: trip.route_id,
    tripId: trip.trip_id,
    directionId: trip.direction_id,
    shapeId: trip.shape_id
  }
}

const toRoute = (routes: any[]): Route => {
  const route = first(routes);
  
  return {
    routeId: route.route_id,
    color: route.route_color
  }
}

export default GtfsRepository;
