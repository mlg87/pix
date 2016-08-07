Template.seasonSchedule.reactiveVars
  withTemplateHelper:
    seasonSchedule: null

Template.seasonSchedule.onCreated ->
  inst = Template.instance()
  # get the schedule
  Meteor.call 'getSeasonSchedule', (err, res) ->
    if err
      sAlert.error err
      return
    console.log res.data.weeks
    inst.seasonSchedule.set res.data.weeks
