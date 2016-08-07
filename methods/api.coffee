# HTTP = require

if Meteor.isServer
  Meteor.methods
    'getSeasonSchedule': ->
      HTTP.call 'GET', 'http://api.sportradar.us/nfl-ot1/games/2016/REG/schedule.json?api_key=hfab9wdj6g3rb9ppa86ud5jz', {}
