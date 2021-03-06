mediator = require 'mediator'
View = require 'views/view'
template = require './templates/sidebar'

module.exports = class SidebarView extends View

  # This is a workaround.
  # In the end you might want to used precompiled templates.
  @template = template

  id: 'sidebar'
  containerSelector: '#sidebar-container'
  autoRender: true

  initialize: ->
    super
    @subscribeEvent 'loginStatus', @loginStatusHandler
    @subscribeEvent 'userData', @render

  loginStatusHandler: (loggedIn) =>
    #console.debug 'SidebarView#loginStatusHandler', loggedIn
    if loggedIn
      @model = mediator.user
    else
      @model = null
    @render()
