export enum Direction {
  ToSecondaryTerminal = 'ToSecondaryTerminal',
  ToMainTerminal = 'ToMainTerminal'
}

export interface Line {
  lineId: string;
  directionId: number;
  direction: Direction;
  routeId: string;
  routeHeadsign: string;
  tripId: string;
  tripHeadsign: string;
}