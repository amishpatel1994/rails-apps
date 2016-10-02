@Lift = React.createClass
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.lift.date
			React.DOM.td null, @props.lift.name
			React.DOM.td null, @props.lift.weight_lifted
			React.DOM.td null, @props.lift.num_reps
			React.DOM.td null, @props.lift.one_rm