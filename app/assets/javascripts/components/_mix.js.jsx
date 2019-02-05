class Mix extends React.Component {
  render() {
    return (
      <div>
      <a href={this.props.mix.url}><h2>{this.props.mix.title}</h2></a>
      <p>{this.props.mix.description}</p>
      <button
        onClick={() => this.props.handleDelete(this.props.mix.id)}
      >
      delete
      </button>
      </div>
    )
  }
}
