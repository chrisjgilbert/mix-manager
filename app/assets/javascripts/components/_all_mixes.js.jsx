const AllMixes = (props) => {
  let fruits = props.mixes.map((mix) => {
    return (
      <div key={mix.id}>
        <a href={mix.url}><h2>{mix.title}</h2></a>
        <p>{mix.description}</p>
      </div>
    )
  })
  return (
    <div>
      {fruits}
    </div>
  )
}
