const AllMixes = (props) => {
  let mixes = props.mixes.map((mix) => {
    return (
      <div key={mix.id}>
        <Mix mix={mix} handleDelete={props.handleDelete} />
      </div>
    )
  })
  return (
    <div>
      {mixes}
    </div>
  )
}
