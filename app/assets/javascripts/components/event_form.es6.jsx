class EventForm extends React.Component {
  render () {
    return (
      <div className="columns">
        <div className="column is-third">
          <img src="http://placehold.it/300x225" alt=""/>
        </div>
        <div className="column">
          <p className="control">
            <label className="label">Title</label>
            <input className="input" type="text" placeholder="Event title"/>
          </p>
          <p className="control">
            <label className="label">Video url</label>
            <input className="input" type="text" placeholder="Video url"/>
          </p>
          <p className="control">
            <label className="label">Date</label>
            <input className="input" type="text" placeholder="Event Date"/>
          </p>
          <p className="control">
            <label className="checkbox">
              <input type="checkbox"/>
              is Priority?
            </label>
          </p>
          <p className="control">
            <button className="button is-primary">Submit</button>
            <button className="button">Cancel</button>
          </p>
        </div>
      </div>
    );
  }
}
