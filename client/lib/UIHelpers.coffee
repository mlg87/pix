# log something
UI.registerHelper 'log', (toLog, msg='LOG FROM UI') ->
  console.log msg, toLog

# logic
UI.registerHelper 'ifThen', (condition, returnValue) ->
  if condition then returnValue

UI.registerHelper 'ifElse', (condition, returnValue, elseValue) ->
  if condition then returnValue else elseValue

# string manipulation
UI.registerHelper 'toCaps', (string) ->
  _.toUpper _.startCase string

UI.registerHelper 'lowerCase', (string) ->
  _.lowerCase string

UI.registerHelper 'startCase', (string) ->
  _.startCase _.toLower string

# date and time
UI.registerHelper 'formatDate', (date) ->
  moment(date).format('dddd, MMMM Do YYYY, h:mm:ss a')
