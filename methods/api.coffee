# HTTP = require

if Meteor.isServer
  Meteor.methods
    'getSeasonSchedule': ->
      HTTP.call 'GET', 'http://api.sportradar.us/nfl-ot1/games/2016/REG/schedule.json?api_key=hfab9wdj6g3rb9ppa86ud5jz', {}

    'createGames': ->
      res = HTTP.call 'GET', 'http://api.sportradar.us/nfl-ot1/games/2016/REG/schedule.json?api_key=hfab9wdj6g3rb9ppa86ud5jz', {}

      season = res.data.weeks
      _.forEach season, (week) ->
        weekName = week.title
        _.forEach week.games, (game) ->
          gameForDb = new PIX.Game()
          gameForDb.set
            week: weekName
            home: game.home.name
            away: game.away.name
            stadium: game.venue.name
            surface: game.venue.surface
            kickoff:
              jsDate: moment(game.scheduled).toDate()
              dayOfWeek: moment(game.scheduled).format('dddd')
              dayOfMonth: moment(game.scheduled).format('D')
          gameForDb.save()
