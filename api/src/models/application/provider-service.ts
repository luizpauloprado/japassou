import { Line } from "../services/line";

export interface ProviderService {
  authenticate: () => Promise<boolean>;
  searchLines: (description: string) => Promise<Line[]>;
}