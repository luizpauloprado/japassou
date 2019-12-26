import { capitalize } from 'lodash';

export const capitalizeWords = (text: string): string =>
  text
    .split(' ')
    .map(capitalize)
    .join(' ') || '';
