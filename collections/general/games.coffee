Astronomy = require 'meteor/jagi:astronomy'

_kickoff = Astronomy.Class.create
  name: '_kickoff'
  fields:
    jsDate: Date
    dayOfWeek: String
    dayOfMonth: String

_score = Astronomy.Class.create
  name: '_score'
  fields:
    home: Number
    away: Number

PIX.Games = new Mongo.Collection 'games'
PIX.Game = PIX.BaseClass.inherit
  name: 'Game'
  collection: PIX.Games
  fields:
    # week 1 = 1; wildcard wound = 18
    week: String
    home: String
    away: String
    stadium: String
    surface: String
    kickoff: _kickoff
    # spread is always relative to away team
    spread:
      type: Number
      optional: true
    score:
      type: _score
      optional: true
