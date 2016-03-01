import React from 'react';
import { Provider } from 'react-redux';

import createStore from '../store/helloWorldStore';
import DiscoAdmin from '../containers/DiscoAdmin';

// See documentation for https://github.com/rackt/react-redux.
// This is how you get props from the Rails view into the redux store.
// This code here binds your smart component to the redux store.
export default (props) => {
  const store = createStore(props);
  const reactComponent = (
    <Provider store={store}>
      <DiscoAdmin />
    </Provider>
  );
  return reactComponent;
};
