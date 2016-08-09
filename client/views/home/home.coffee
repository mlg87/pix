Template.home.reactiveVars
  withTemplateHelper:
    signedInUser: null
    seasonSchedule: null

Template.home.onCreated ->
  @signedInUser.set Meteor.user()

Template.home.events
  'click .accept': (e, inst) ->
    e.preventDefault()

    Meteor.call 'getSeasonSchedule', (err, res) ->
      if err
        sAlert.error err
        return
      console.log res.data.weeks
      
      inst.seasonSchedule.set res.data.weeks
