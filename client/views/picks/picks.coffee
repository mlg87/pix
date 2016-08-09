Template.picks.reactiveVars
  weekQuery: {week: '1'}
  withTemplateHelper:
    week: null

Template.picks.subscriptions
  games: ->
    query: Template.instance().weekQuery.get()

Template.picks.onCreated ->
  inst = Template.instance()
  @autorun ->
    games = PIX.Games.find(inst.weekQuery.get()).fetch()



    inst.week.set
      week: inst.weekQuery.get()?.week
      games:

Template.picks.helpers
  week: ->
    games = PIX.Games.find(inst.weekQuery.get()).fetch()
    gameGroups = []
    _.
