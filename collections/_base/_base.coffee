Class = require('meteor/jagi:astronomy').Class

PIX.BaseClass = Class.create
  name: 'BaseClass'
  fields:
    createdAt: Date
    updatedAt:
      type: Date
      default: null
      optional: true
  events:
    beforeInsert: (e) ->
      e.target.set 'createdAt', new Date()
    beforeUpdate: (e) ->
      e.target.set 'updatedAt', new Date()
