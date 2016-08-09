Template.navbar.reactiveVars
  withTemplateHelper:
    links: []

Template.navbar.onCreated ->
  @autorun =>
    $('.dropdown-button').dropdown()

    links =
      if Meteor.user()
        [
          {value: 'pools'}
          {value: 'picks'}
          {value: 'smack'}
          {value: 'standings'}
          {value: 'profile', id: 'profile-options', dropdown: true, options: USER_PROFILE_OPTIONS}
        ]
      else
        [
          {value: 'login'}
        ]
    @links.set links

USER_PROFILE_OPTIONS = [
  {value: 'profile'}
  {value: 'friends'}
  {value: 'spending'}
  {divider: true}
  {value: 'logOut'}
]


# Template.navbar.helpers
#  links: ->
#    if Meteor.user()
#      [
#        {value: 'home'}
#        {value: 'account'}
#        {value: 'search'}
#      ]
#    else
#      [
#        {value: 'login'}
#      ]
