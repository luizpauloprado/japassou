export interface Positions {
    lastUpdate: String;
    currentPositions: CurrentPosition[];
}

export interface CurrentPosition {
    latitude: number;
    longitude: number;
}