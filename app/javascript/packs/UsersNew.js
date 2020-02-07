import React, { useState, useEffect } from 'react'

const UsersNew = props => {
  const [users, setUsers] = useState();

  async function fetchUsers() {
    const container = document.getElementById('params_container')
    const host = container.getAttribute('host')

    const users_fetch = await fetch(`${host}/admin/statics/companies/companies_select`);
    users_fetch
      .json()
      .then(res => {
        let select = document.getElementById("companies_select");
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
      <form action='/admin/statics/users' method='POST' id='admin-form'>

        <div className="field">
          <label>Name</label>
          <input type="text" name="user[name]" />
        </div>
        <div className="field">
          <label>Last Name</label>
          <input type="text" name="user[lastname]" />
        </div>
        <div className="field">
          <label>Email</label>
          <input type="email" name="user[email]" />
        </div>
        <div className="field">
          <label>Password</label>
          <input type="password" name="user[password]" />
        </div>
        <div className="field">
          <label>Company</label>
          <select id="companies_select" name="user[company_id]" />
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

export default UsersNew;