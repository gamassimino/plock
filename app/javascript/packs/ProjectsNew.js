import React, { useState, useEffect } from 'react'

const ProjectsNew = props => {
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
      <form action='/admin/statics/projects' method='POST' id='admin-form'>

        <div className="field">
          <label>Name</label>
          <input type="text" name="project[name]" />
        </div>
        <div className="field">
          <label>Repository</label>
          <input type="text" name="project[repository]" />
        </div>
        <div className="field">
          <label>Cost</label>
          <input type="number" name="project[cost]" />
        </div>
        <div className="field">
          <label>Start at</label>
          <input type="date" name="project[start_at]" />
        </div>
        <div className="field">
          <label>Members</label>
          <select id="users_select" name="project[user_id]" />
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

export default ProjectsNew;