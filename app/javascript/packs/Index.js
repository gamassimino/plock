import React, { useState, useEffect } from 'react'
import ReactDOM from 'react-dom'
import Table from './Table'

const Index = props => {
  const [records, setRecords] = useState([]);
  const [user, setUser] = useState('')
  
  async function fetchRecords() {
    const records_fetch = await fetch(`http://localhost:3000/admin/statics/${props.record}/${props.record}_table`);
    records_fetch
      .json()
      .then(res => {
        setRecords([...records, res])
      });
  }  

  useEffect(() => {
    fetchRecords();
  }, [user]);

  return(
    <div>
      <br/>
      <nav className="navbar navbar-expand-lg navbar navbar-dark bg-dark">
        <a className="navbar-brand" href="/"> <b> Plock Admin Dashboard</b> </a>
        <div className="navbar-nav ml-auto"></div>
      </nav>

      <Table models={records} />

      <footer className="bg-dark admin-footer">
        Plock timesheets ® Plum
      </footer>
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('record_name');
  const data = JSON.parse(node.getAttribute('data'));
  ReactDOM.render(
    <Index record={data}/>,
    document.body.appendChild(document.createElement('div')),
  )
})