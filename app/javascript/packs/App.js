import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter } from 'react-router-dom'

import Header from './Header'
import Footer from './Footer'
import Router from './Router';

const App = props => {
  return(
    <BrowserRouter>
      <Header />
      <Router />
      <Footer />
    </BrowserRouter>   
  )
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})