import React from 'react';

const EventsList = (props) => {
  const events = props.events
  debugger;

  const renderEvents = events.map((event) => {
    return (
      <tr>
        <td>{event.title}</td>
        <td>{event.event_date}</td>
        <td>{event.is_prior}</td>
        <td className="table-link table-icon">
          <a href="#">
            <i className="fa fa-edit"></i>
          </a>
        </td>
      </tr>
    )
  })

  return(
    <table className="table">
      <thead>
        <tr>
          <th>Event title</th>
          <th>Date</th>
          <th>Priority</th>
          <th></th>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <th>Event title</th>
          <th>Date</th>
          <th>Priority</th>
          <th></th>
        </tr>
      </tfoot>
      <tbody>
        {renderEvents}
      </tbody>
    </table>
  )
}

export default EventsList
