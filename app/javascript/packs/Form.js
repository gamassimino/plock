import React, { useState, useEffect } from 'react'

const Form = props => {
  return(
    <div className='admin-form'> 
      <form action='' id='admin-form'>
        
        <div className="field">
          <label>name</label>
          <input type="text" name="{props.name}" />
        </div> 
        <div className="field">
          <label>description</label>
          <input type="text" name="{props.description}" />
        </div> 
        
        <div className="actions">
          <button type="submit">Create</button>
          <a href="/admin">
            <button>Back</button>
          </a>
        </div>
      </form>
    </div>
  )
}

export default Form;