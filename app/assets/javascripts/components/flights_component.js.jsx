class FlightsComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = { flights: [] }
    this.flightData = [];
  }

  componentDidMount() { 
    this.flightsRequest = $.get('/api/flights', 
        function(data) {
          this.setState({ flights: data });
          this.flightData = data;
        }.bind(this)
    );
  }

  componentWillUnmount() { 
    this.flightsRequest.abort();
  }

  onSearchChange(inputText) {
    filtered_flights = this.flightData.filter(function(flight) {
      return (flight.destination.toLowerCase().indexOf(inputText.toLowerCase()) > -1) 
    });

    this.setState({ flights: filtered_flights });
  }

  render() {
    return (
      <div>
        <p>Departure Flights from CPH Aiport</p>
        <Search onChange={this.onSearchChange.bind(this)} />
        <FlightsTable flights={this.state.flights} />
      </div>
    );
  }
}
