import React, { useState, useEffect } from 'react'

const CompaniesNew = props => {
  const [users, setUsers] = useState();

  async function fetchUsers() {
    const container = document.getElementById('params_container')
    const host = container.getAttribute('host')

    const users_fetch = await fetch(`${host}/admin/statics/users/user_select`);
    users_fetch
      .json()
      .then(res => {
        let select = document.getElementById("users_select");
        res.forEach(element => {
          let option = document.createElement("option");
          option.text = element[0];
          option.value = element[1];
          select.add(option);
        });
      });
  }

  useEffect(() => {
    fetchUsers();
  }, []);

  return(
    <div className='admin-form'>
      <form action='/admin/statics/companies' method='POST' id='admin-form'>

        <div className="field">
          <label>Name</label>
          <input type="text" name="company[name]" />
        </div>
        <div className="field">
          <label>Description</label>
          <input type="text" name="company[description]" />
        </div>
        <div className="field">
          <label>User</label>
          <select id="users_select" name="company[user_id]" />
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

export default CompaniesNew;