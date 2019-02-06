class Body extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      mixes: []
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.addNewMix = this.addNewMix.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
    this.deleteMix = this.deleteMix.bind(this)
  }

  componentDidMount() {
    fetch("api/v1/mixes.json")
      .then(
        res => res.json())
      .then(
        (result) => {
          this.setState({
            error: null,
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
      mixes: this.state.mixes.push(mix)
    })
  }

  handleDelete(id) {
    fetch(`/api/v1/mixes/${id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type' : 'application/json'
      }
    }).then(
      (response) => {
        this.deleteMix(id)
      })
  }

  deleteMix(id) {
    let updatedMixes = this.state.mixes.filter(mix => mix.id !== id)
    this.setState({
      mixes: updatedMixes
    })
  }

  render() {
    return (
      <div>
        <NewMix handleFormSubmit={this.handleFormSubmit} />
        <AllMixes mixes={this.state.mixes} handleDelete={this.handleDelete} />
      </div>
    )
  }
}
