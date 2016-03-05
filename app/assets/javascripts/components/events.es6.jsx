class Events extends React.Component {
  render () {
    return (
      <section className="section">
        <div className="container">
          {/*<div className="heading">
            <h1 className="title">Section</h1>
            <h2 className="subtitle">
              A simple container to divide your page into <strong>sections</strong>, like the one you're currently reading
            </h2>
          </div>*/}
          <div className="columns">
            <div className="column is-third">
              <EventsList />
            </div>
            <div className="column">
              <EventsTabs />
              <EventForm />
            </div>
          </div>
        </div>
      </section>
    );
  }
}
