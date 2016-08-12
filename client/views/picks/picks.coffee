Template.picks.reactiveVars
  weekQuery: {week: '1'}
  # withTemplateHelper:
  #   week: null

Template.picks.subscriptions
  games: -> {}
    # query: Template.instance().weekQuery.get()



Template.picks.onCreated ->
  inst = Template.instance()
  @autorun ->
    games = PIX.Games.find(inst.weekQuery.get()).fetch()


  #
  #   inst.week.set
  #     week: inst.weekQuery.get()?.week
  #     games:

Template.picks.helpers
  week: ->
    inst = Template.instance()
    console.log games = PIX.Games.find(inst.weekQuery.get(), {$sort: {kickoff: 1}}).fetch()

    if games.length
      # group games by the day they are played
      groups = _.groupBy games, (game) ->
        moment(game.kickoff.jsDate).format('dddd, MMMM D')

      gameGroups = []
      _.forEach groups, (games, day) ->
        gameGroups.push
          day:
            displayDate: day
            dayOfMonth: games[0].kickoff.dayOfMonth
          games: games

      {
        week: inst.weekQuery.get().week
        gameGroups: _.sortBy gameGroups, (group) -> Number group.day.dayOfMonth
      }

  weekLinks: ->
    i = 1
    weeks = []
    while i <= 17
      weeks.push i
      i++

  isActiveWeek: (week) ->
    Template.instance().weekQuery.get().week is _.toString @

Template.picks.events
  'click .week': (e, inst) ->
    week = _.toString $(e.target).data('week')
    inst.weekQuery.set {week: week}
