import React, { useState, useEffect } from 'react'
import ReactDOM from 'react-dom'
import ModelList from './ModelList'

const Dashboard = props => {
  const [Data, setData] = useState();
  const [user, setUser] = useState('')

  async function fetchData() {
    const companies_fetch = await fetch("http://localhost:3000/admin/models_count");
    companies_fetch
      .json()
      .then(res => setData(res));
  }  

  useEffect(() => {
    fetchData();
  }, [user]);

  return(
    <div>
      <br/>
      <nav className="navbar navbar-expand-lg navbar navbar-dark bg-dark">
        <a className="navbar-brand" href="/"> <b> Plock Admin Dashboard</b> </a>
        <div className="navbar-nav ml-auto"></div>
      </nav>

      <ModelList  {...Data} />

      <footer className="bg-dark admin-footer">
        Plock timesheets ® Plum
      </footer>
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Dashboard />,
    document.body.appendChild(document.createElement('div')),
  )
})
