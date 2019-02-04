class AllMixes extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      mixes: []
    }
  }

  componentDidMount() {
    fetch('api/v1/mixes.json')
      .then((response) => { return response.json() })
      .then((data) => { this.setState ({ mixes: data }) })
  }

  render() {
    let mixes = this.state.mixes.map((mix) => {
      return (
        <div key={mix.id}>
          <h2>{mix.title}</h2>
          <p>{mix.description}</p>
          <a href={mix.url}>Link</a>
        </div>
      )
    })
    return (
      <div>
        {mixes}
      </div>
    )
  }
}
