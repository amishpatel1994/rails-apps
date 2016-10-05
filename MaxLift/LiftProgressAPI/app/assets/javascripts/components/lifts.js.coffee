@Lifts = React.createClass
  getInitialState: ->
    lifts: @props.data

  getDefaultProps: ->
    lifts: []

  addLift: (lift) ->
  	lifts = @state.lifts.slice()
  	lifts.push lift
  	@setState lifts: lifts

  deleteLift: (lift) ->
  	lifts = @state.lifts.slice()
  	index = lifts.indexOf lift
  	lifts.splice index, 1
  	@replaceState lifts: lifts

  render: ->
    React.DOM.div
      className: 'lifts'
      React.DOM.h1
        className: 'title'
        'Previous Lifts'

      React.createElement LiftForm, handleNewLift: @addLift

      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Weight Lifted'
            React.DOM.th null, 'Metric ?'
            React.DOM.th null, 'Number of Lifts'
            React.DOM.th null, '1 RM'
            React.DOM.th null, 'Delete'
          React.DOM.tbody null,
            for lift in @state.lifts
              React.createElement Lift, key: lift.id, lift: lift, handleDeleteLift: @deleteLift