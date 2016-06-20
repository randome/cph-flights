class FlightsComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = { flights: [] }
  }

  componentDidMount() { 
    this.flightsRequest = $.get('/api/flights', 
        function(data) {
          this.setState({flights: data});
        }.bind(this)
    );
  }

  componentWillUnmount() { 
    this.flightsRequest.abort();
  }

  render() {
    return (
      <div>
        <p>Departure Flights from CPH Aiport</p>
        <FlightsTable flights={this.state.flights} />
      </div>
    );
  }
}
