@Lift = React.createClass

	handleDelete: (e) ->
		e.preventDefault()
		$.ajax
			method: 'DELETE'
			url: "/lifts/#{ @props.lift.id }"
			dataType: 'JSON'
			success: () =>
				console.log("Hello???")
				@props.handleDeleteLift @props.lift

	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.lift.date
			React.DOM.td null, @props.lift.name
			React.DOM.td null, @props.lift.weight_lifted
			React.DOM.td null, @props.lift.is_metric.toString()
			React.DOM.td null, @props.lift.num_reps
			React.DOM.td null, @props.lift.one_rm
			React.DOM.td null, 
				React.DOM.a
					className: 'btn btn-danger'
					onClick: @handleDelete
					'Delete'