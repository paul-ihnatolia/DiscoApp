import actionTypes from '../constants/discoAdminConstants';

export function selectEvent(event) {
  return {
    type: actionTypes.EVENT_SELECT,
    event,
  };
}
