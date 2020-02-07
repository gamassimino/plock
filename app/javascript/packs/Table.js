import React from 'react'

const model_table_header = function(models){
  let model = models[0];
  let header = document.getElementById('table-header');
  let row = header.insertRow(0);

  Object.keys(model).forEach((key, i) => {
    let cell = row.insertCell(i);
    cell.innerHTML = `<th>${key}</th>`;
  });
}

const model_table = function (models) {
  let body = document.getElementById('table-body');
  models.forEach((model, i) => {
    let index = i === 0 ? 0 : -1;
    let row = body.insertRow(index);

    Object.keys(model).forEach((key, j) => {
      let cell = row.insertCell(j);
      cell.innerHTML = `<th>${model[key]}</th>`
    })
  });
};

const Table = props => {
  return(
    <div>
      <table className='admin-table' id='table'>
        <thead id='table-header'>
          {props.models.forEach( models => model_table_header(models)) }
        </thead>
        <tbody id='table-body'>
          {props.models.forEach( models => model_table(models)) }
        </tbody>
      </table>
    </div>
  )
}

export default Table;