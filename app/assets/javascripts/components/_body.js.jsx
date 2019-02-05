class Body extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      mixes: []
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.addNewMix = this.addNewMix.bind(this)
  }

  componentDidMount() {
    fetch("api/v1/mixes.json")
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({
            erro: null,
            isLoaded: false,
            mixes: result
          });
        },
        (error) => {
          this.setState({
            isLoaded: true,
            error
          });
        }
      )
    }

  handleFormSubmit(title, description, url) {
    let body = JSON.stringify({ mix: { title: title, description: description, url: url } })

    fetch('/api/v1/mixes', {
      method: 'POST',
      headers: {
        'Content-Type' : 'application/json'
      },
      body: body,
    }).then(
      (response) => {
        return json.response()
      }).then(
        (mix) => {
      this.addNewMix(mix)
    })
  }

  addNewMix(mix){
    this.setState({
      mixea: this.state.mixes.push(mix)
    })
  }

  render() {
    return (
      <div>
        <NewMix handleFormSubmit={this.handleFormSubmit} />
        <AllMixes mixes={this.state.mixes} />
      </div>
    )
  }
}
