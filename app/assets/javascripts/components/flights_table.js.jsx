class FlightsTable extends React.Component {

  flights() {
    return this.props.flights.map(function(flight) {
      return (
        <tr>
          <td>{ flight.scheduled_time }</td>
          <td>{ flight.delayed_time }</td>
          <td>{ flight.airline }</td>
          <td>{ flight.destination }</td>
          <td>{ flight.gate }</td>
          <td>{ flight.terminal }</td>
          <td>{ flight.flight_status }</td>
        </tr>
      );
    }); 
  }

  render() {
    return (
    <table className="table table-hover">
      <thead>
        <tr>
          <th>Scheduled Time</th>
          <th>Delayed Time</th>
          <th>Airline</th>
          <th>Flying To</th>
          <th>Gate</th>
          <th>Terminal</th>
          <th>Flight Status</th>
        </tr>
      </thead>
      <tbody>
        {this.flights()}
      </tbody>
    </table>
    );
  }
}
