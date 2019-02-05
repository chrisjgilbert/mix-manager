const NewMix = (props) => {
  let formFields = {}

  return (
    <form
     onSubmit={ (e) => { props.handleFormSubmit(formFields.title.value, formFields.description.value, formFields.url.value); e.target.reset(); } }>
      <input id='title' ref={input => formFields.title = input} placeholder='title' />
      <input id='description' ref={input => formFields.description = input} placeholder='description' />
      <input id='url' ref={input => formFields.url = input} placeholder='url' />
      <button id='submit' value='Submit'>Add Mix</button>
    </form>
  )
}
