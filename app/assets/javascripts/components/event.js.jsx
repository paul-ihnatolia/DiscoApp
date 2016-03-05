var Event = React.createClass({
  propTypes: {
    event: React.PropTypes.instanceOf(Event)
  },

  render: function() {
    return (
      <div>
        <div>Event: {this.props.event}</div>
      </div>
    );
  }
});
