import eventsReducer from './eventsReducer';
import { $$initialState as $$eventsState } from './eventsReducer';

export default {
  $$eventsStore: eventsReducer,
};

export const initialStates = {
  $$eventsState,
};
