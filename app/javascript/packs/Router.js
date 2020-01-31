import React from 'react';
import { Switch, Route } from 'react-router-dom'

import CompaniesNew from './CompaniesNew';
import IntervalsNew from './IntervalsNew';
import TracksNew from './TracksNew';
import UsersNew from './UsersNew';
import ProjectsNew from './ProjectsNew';
import TeamsNew from './TeamsNew';
import Dashboard from './Dashboard';
import Index from './Index';

const Router = ({match}) => {
	return(
		<Switch>
			<Route exact path="/admin" component={Dashboard} />
			<Route exact path="/admin/statics/:model" component={Index} />
			<Route exact path="/admin/statics/companies/new" component={CompaniesNew} />
			<Route exact path="/admin/statics/intervals/new" component={IntervalsNew} />
			<Route exact path="/admin/statics/tracks/new" component={TracksNew} />
			<Route exact path="/admin/statics/users/new" component={UsersNew} />
			<Route exact path="/admin/statics/projects/new" component={ProjectsNew} />
			<Route exact path="/admin/statics/teams/new" component={TeamsNew} />          
		</Switch>			
	)
}

export default Router;