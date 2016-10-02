@LiftForm = React.createClass
	getInitialState: ->
		date: ''
		name: ''
		is_metric: ''
		weight_lifted: ''
		num_reps: ''
		one_rm: ''

	handleValueChange: (e) ->
		value_name = e.target.name
		@setState "#{ value_name }": e.target.value

	valid: ->
		@state.date && @state.name && @state.is_metric && @state.weight_lifted && @state.num_reps && @state.one_rm

	handleSubmit: (e) ->
		e.preventDefault()
		$.post '', { lift: @state }, (data) =>
			@props.handleNewLift data
			@setState @getInitialState()
		, "JSON"

	render: ->
		React.DOM.form
			className: 'form-inline'
			onSubmit: @handleSubmit
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					type: 'date'
					className: 'form-control'
					placeholder: 'date'
					name: 'date'
					value: @state.date
					onChange: @handleValueChange
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'name'
					name: 'name'
					value: @state.name
					onChange: @handleValueChange
				React.DOM.input
					type: 'boolean'
					className: 'form-control'
					placeholder: 'Is metric?'
					name: 'is_metric'
					value: @state.is_metric
					onChange: @handleValueChange
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'weight lifted'
					name: 'weight_lifted'
					value: @state.weight_lifted
					onChange: @handleValueChange
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'Number of reps'
					name: 'num_reps'
					value: @state.num_reps
					onChange: @handleValueChange
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'One RM'
					name: 'one_rm'
					value: @state.one_rm
					onChange: @handleValueChange
				React.DOM.button
					type: 'submit'
					className: 'btn btn-primary'
					disabled: !@valid()
					'Create Lift'
