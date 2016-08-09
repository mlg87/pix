# set the global namespace
@PIX = {}

# Allow accessing parent template's instance by it's name
# -------------------------------------------------------
Blaze.TemplateInstance.prototype.parentInstance = (templateName) ->
  unless /^Template\./.test(templateName)
    templateName = 'Template.' + templateName;
  view = @view
  while (view = view.parentView)
    if (view.name is templateName)
      return view.templateInstance()

$.fn.extend
  serializeJSON: ->
    form = {}
    _.each @serializeArray(), (field) ->
      form[field.name] = field.value.trim()
    form

###*
 * an extension of the template prototype to allow easier declaration of subs
 * @param  {Object} subs an object of methods that return an object containing
 *                       the query, options and autorun boolean. If a sub is null
 *                       we don't do anything.
###
Template.prototype.subscriptions = (subs) ->
  templateName = @viewName.replace 'Template.', ''
  Template[templateName].onCreated ->
    @autorun =>
      _.each subs, (sub, collection) =>
        sub = sub()
        if sub.condition is undefined or sub.condition
          return unless sub
          if sub.autorun
            @subscribe collection, sub.query, sub.options, sub.settings
    _.each subs, (sub, collection) =>
      sub = sub()
      if sub.condition is undefined or sub.condition
        return unless sub
        unless sub.autorun
          @subscribe collection, sub.query, sub.options, sub.settings

# sAlert
# ------
sAlert.config
  effect: 'slide'

sAlertError = sAlert.error

sAlert.error = (err) ->
  return unless err
  return if err.error is 'throttle'
  if err.error is 500
    sAlertError.call sAlert, 'An error occurred. We have been notified. We\'re on it!'
  else
    sAlertError.call sAlert, err.reason or err
