Astronomy = require 'meteor/jagi:astronomy'
Validators = Astronomy.Validators
# BaseClass = require('../_base/_base.coffee').class

_email = Astronomy.Class.create
  name: '_email'
  fields:
    address: String
    verified: Boolean

PIX.Users = Meteor.users
PIX.User = PIX.BaseClass.inherit
  name: 'User'
  collection: PIX.Users
  fields:
    username: String
    services: Object
    emails: [_email]
    firstName: String
    lastName: String
