Astronomy = require 'meteor/jagi:astronomy'

_email = Astronomy.Class.create
  name: '_email'
  fields:
    address: String
    verified: Boolean

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
    kickoff: Date
    # spread is always relative to away team
    spread:
      type: Number
      optional: true
