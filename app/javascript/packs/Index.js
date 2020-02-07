import React, { useState, useEffect } from 'react'

import Table from './Table'

const Index = ({match}) => {
  const [records, setRecords] = useState([]);
  const [user, setUser] = useState('');

  async function fetchRecords() {
    const container = document.getElementById('params_container')
    const host = container.getAttribute('host')

    const records_fetch = await fetch(`${host}/admin/statics/${match.params.model}/${match.params.model}_table`);
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
      <Table models={records} />
    </div>
  )
}

export default Index;