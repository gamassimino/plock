import React, { useState, useEffect } from 'react';

const IntervalsNew = ({match}) => {
  useEffect(() => {
    let markup = ''
    switch (match.params.model) {
      case 'companies':
        // markup = <CompanyForm />;
        break;

      default:
        break;
    }
    document.getElementById('model-form-container').innerHTML = markup;
  }, []);

  return(
    <div id='model-form-container'></div>
  )
}

export default IntervalsNew;