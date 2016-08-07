Meteor.publish 'users', (query={}, options={}) ->
  return @ready() unless @userId?
  # SECURITY - user can only see users from the same client
  # user = PIX.Users.findOne {_id: @userId}

  PIX.Users.find query, options
