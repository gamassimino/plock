import React from 'react'
import { Link } from 'react-router-dom'

const Model = props => {	
	return(
		<div className='box'>
			<div className='model-count'>
				{props.count !== undefined ? props.count.toString().padStart(4,'0') : ''}
			</div>
			
			<div className='model-name'>
				{props.name}
			</div>
			
			<Link to={`/admin/statics/${props.name.toLowerCase()}/new`}>
				<div className='add-button'>
					New
				</div>
			</Link>			
			<Link to={`/admin/statics/${props.name.toLowerCase()}`}>
				<div className='list-button'>
					Show All
				</div>
			</Link>
		</div>
	)
}

export default Model;