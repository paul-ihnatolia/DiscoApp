import React, { PropTypes } from 'react';
import { connect } from 'react-redux';
import { Router, browserHistory } from 'react-router'
import routes from '../startup/routes'

import Header from '../components/Header';


class DiscoAdmin extends React.Component {
  constructor(props, context) {
    super(props, context);
  }

  render() {
    return (
      <div>
        <Header pageTitle="Events" pageDescription="You can events and event albums here"/>
        <Router history={browserHistory} routes={routes}/>
      </div>
    );
  }
}

export default connect()(DiscoAdmin);
