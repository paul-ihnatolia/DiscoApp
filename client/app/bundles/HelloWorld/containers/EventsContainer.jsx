import React, { PropTypes } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import Immutable from 'immutable';

import * as eventActions from '../actions/eventActions';



import EventsList from '../components/EventsList'
// import ComponentTabs from '../components/layout/ComponentTabs'
// import CoursesList from '../components/CoursesList';
// import CourseDetails from '../components/CourseDetails';


function select(state) {
  return {
    $$eventsStore: state.$$eventsStore,
    // selectedCourse: state.selectedCourse
  };
}

class EventsContainer extends React.Component {
  static propTypes = {
    dispatch: PropTypes.func.isRequired,
    $$eventsStore: PropTypes.instanceOf(Immutable.Map).isRequired,
  };

  constructor(props, context) {
    super(props, context);
  }

  // selectCourseForEdit(course) {
  //   console.log("Hello from container")
  // }

  render() {
    const { dispatch, $$eventsStore} = this.props;
    const actions = bindActionCreators(eventActions, dispatch);
    const { selectCourse } = actions;
    const eventsList = $$eventsStore.get('list').toJS();

    return (
      <section className="section">
        <div className="container">
          <section className="columns">
            <div className="column is-third">
              <EventsList events={eventsList} />
            </div>
            <div className="column">
            </div>
          </section>
        </div>
      </section>
    )

  }
}

export default connect(select)(EventsContainer);
