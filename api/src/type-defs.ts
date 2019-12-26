import { gql } from 'apollo-server-express';

export const typeDefs = gql`
  type Query {
    authenticate: Boolean!
    searchLines(description: String!): [Line]
    getTrip(tripId: String!): Trip
  }
  type Line {
    lineId: String!
    directionId: Int!
    direction: String!
    routeId: String!
    routeHeadsign: String!
    tripId: String!
    tripHeadsign: String!
  }
  type Route {
    routeId: String!
    color: String!
  }
  type Trip {
    routeId: String!
    tripId: String!
    directionId: String!
    shapeId: String!
    route: Route!
  }
`;
