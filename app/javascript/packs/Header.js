import React from 'react'
import { Link } from 'react-router-dom'

const Header = props => {
  return(    
    <nav className="navbar navbar-expand-lg navbar navbar-dark bg-dark">
      <Link to="/admin" className="navbar-brand">
        <b> Plock Admin Dashboard</b>        
      </Link>
      <div className="navbar-nav ml-auto"></div>
    </nav>
  )
}

export default Header;