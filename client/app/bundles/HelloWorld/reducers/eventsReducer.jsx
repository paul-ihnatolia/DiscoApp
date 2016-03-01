import Immutable from 'immutable';

import actionTypes from '../constants/discoAdminConstants';

export const $$initialState = Immutable.fromJS({
  list: [
    {
      title: 'Event 1',
      event_date: '01/04/1991',
      video_url: 'John Smith',
      is_prior: false,
      banner_file_name: 'https://pp.vk.me/c628327/v628327583/3f401/rTMqGODwx0M.jpg'
    },
    {
      title: 'Event 2',
      event_date: '01/04/1991',
      video_url: 'John Smith',
      is_prior: false,
      banner_file_name: 'https://pp.vk.me/c628327/v628327583/3f401/rTMqGODwx0M.jpg'
    },
    {
      title: 'Event 3',
      event_date: '01/04/1991',
      video_url: 'John Smith',
      is_prior: false,
      banner_file_name: 'https://pp.vk.me/c628327/v628327583/3f401/rTMqGODwx0M.jpg'
    },
    {
      title: 'Event 4',
      event_date: '01/04/1991',
      video_url: 'John Smith',
      is_prior: false,
      banner_file_name: 'https://pp.vk.me/c628327/v628327583/3f401/rTMqGODwx0M.jpg'
    }
  ],
  selectedEvent: {}
});


export default function eventsReducer($$state = $$initialState, action) {
  const { type } = action;

  switch (type) {
    case actionTypes.EVENT_SELECT:
      return $$state.set('selectedEvent', action.event);

    default:
      return $$state;
  }
}
