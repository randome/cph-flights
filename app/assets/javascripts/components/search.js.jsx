class Search extends React.Component {
  handleChange(e) {
    this.props.onChange(e.target.value);
  }

  render() {
    return (
      <form role="search">
        <div className="form-group">
          <input className="form-control" type="search" name="Search" placeholder="Search flights" onChange={this.handleChange.bind(this)}/>
        </div>
      </form>
    );
  }
}
