class Search extends React.Component {
  handleChange(e) {
    this.props.onChange(e.target.value);
  }

  render() {
    return (
        <input type="text" name="Search" placeholder="Search flights" onChange={this.handleChange.bind(this)}/>
    );
  }
}
