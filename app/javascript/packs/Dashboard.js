import React, { useState, useEffect } from 'react';
import ModelList from './ModelList';

const Dashboard = props => {
  const [data, setData] = useState();

  async function fetchData() {
    const container = document.getElementById('params_container')
    const host = container.getAttribute('host')

    const companies_fetch = await fetch(`${host}/admin/models_count`);
    companies_fetch
      .json()
      .then(response => { setData(response) });
  }

  useEffect(() => {
    fetchData();
  }, []);

  return(
    <div>
      <ModelList  {...data} />
    </div>
  )
}

export default Dashboard;