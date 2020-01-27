import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Form from './Form'

const AdminNew = props => {
  return(
    <div>
      <br/>
      <nav className="navbar navbar-expand-lg navbar navbar-dark bg-dark">
        <a className="navbar-brand" href="/admin"> <b> Plock Admin Dashboard</b> </a>
        <div className="navbar-nav ml-auto"></div>
      </nav>

      <Form model={props.model}/>
      
      <footer className="bg-dark admin-footer">
        Plock timesheets ® Plum
      </footer>
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('model_data');
  const data = JSON.parse(node.getAttribute('data'));
  ReactDOM.render(
    <AdminNew model={data}/>,
    document.body.appendChild(document.createElement('div')),
  )
})