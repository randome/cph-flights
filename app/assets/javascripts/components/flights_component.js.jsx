class FlightsComponent extends React.Component {
  render() {
    return (
      <div>
        <p>Flights</p>
        <FlightsTable flights={this.props.flights} />
      </div>
    );
  }
}
