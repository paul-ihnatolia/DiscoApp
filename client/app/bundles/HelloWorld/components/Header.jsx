import React, { PropTypes, Component } from 'react';
import _ from 'lodash';
import jade from 'jade-react!./jade/Header.jade';


export default class Header extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    pageTitle: PropTypes.string.isRequired,
    pageDescription: PropTypes.string,
  };

  constructor(props, context) {
    super(props, context);
    console.log(this.props)

    // Uses lodash to bind all methods to the context of the object instance, otherwise
    // the methods defined here would not refer to the component's class, not the component
    // instance itself.
    // _.bindAll(this, 'handleChange');
  }

  render() {
    return jade({pageTitle: this.props.pageTitle, pageDescription: this.props.pageDescription});
  }
}
