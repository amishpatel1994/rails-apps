coefficients = {
    1: 1, 2: .943, 3: .906, 4: .881, 5: .851, 6: .831, 7: .807, 8: .786, 9: .765, 10: .744
}
@LiftForm = React.createClass
    getInitialState: ->
        date: ''
        name: ''
        is_metric: false
        weight_lifted: ''
        num_reps: ''
        one_rm: 0
  
    calculateOneRm: ->
        if @state.weight_lifted and @state.num_reps
          @state.one_rm = @state.weight_lifted / coefficients[@state.num_reps]
        else
          0

    handleValueChange: (e) ->
        value_name = e.target.name
        @setState "#{ value_name }": e.target.value

    toggleInput: (e) ->
        e.preventDefault()
        @setState is_metric: !@state.is_metric

    valid: ->
        @state.date && @state.name && @state.weight_lifted && @state.num_reps && @state.one_rm

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
                React.DOM.a
                    className: 'btn btn-primary'
                    onClick: @toggleInput
                    'Metric = ' + @state.is_metric.toString()
                React.DOM.input
                    type: 'number'
                    className: 'form-control'
                    placeholder: 'weight lifted'
                    name: 'weight_lifted'
                    value: @state.weight_lifted
                    onChange: @handleValueChange
                React.DOM.input
                    type: 'number'
                    className: 'form-control'
                    min: 1
                    max: 10
                    placeholder: 'Number of reps'
                    name: 'num_reps'
                    value: @state.num_reps
                    onChange: @handleValueChange
                React.DOM.button
                    type: 'submit'
                    className: 'btn btn-primary'
                    disabled: !@valid()
                    'Create Lift'
                React.createElement OneRmBox, one_rm: @calculateOneRm()