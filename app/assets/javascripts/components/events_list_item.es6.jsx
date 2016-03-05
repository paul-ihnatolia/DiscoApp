class EventsListItem extends React.Component {
  render () {
    return (
      <div className="box mb-1">
        <article className="media">
          <div className="media-left">
            <figure className="image is-96x96">
              <img src="http://placehold.it/128x128" alt="Image"/>
            </figure>
          </div>
          <div className="media-content">
            <div className="content">
              <p className="title is-5">John Smith</p>
            </div>
          </div>
        </article>
      </div>
    );
  }
}
