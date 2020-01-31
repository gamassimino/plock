import React, { useState, useEffect } from 'react';

const TracksNew = ({match}) => {
  useEffect(() => {
    let markup = ''
    switch (match.params.model) {
      case 'companies':
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

export default TracksNew;