require('app/styles/about.sass')
RootView = require 'views/core/RootView'
template = require 'templates/about'
fetchJson = require 'core/api/fetch-json'

module.exports = class AboutView extends RootView
  id: 'about-view'
  template: template
  logoutRedirectURL: false
  jobs: []

  events:
    'click #fixed-nav a': 'onClickFixedNavLink'
    'click .screen-thumbnail': 'onClickScreenThumbnail'
    'click #carousel-left': 'onLeftPressed'
    'click #carousel-right': 'onRightPressed'

  shortcuts:
    'right': 'onRightPressed'
    'left': 'onLeftPressed'
    'esc': 'onEscapePressed'

  getMeta: ->
    title: $.i18n.t 'about.title'
    meta: [
      { vmid: 'meta-description', name: 'description', content: $.i18n.t 'about.meta_description' }
    ]

  initialize: (options) ->
    super options
    @loadJobs()

  loadJobs: ->
    url = 'https://api.lever.co/v0/postings/codecombat?skip=0&limit=100&mode=json'
    fetchJson(url).then (response) =>
      @jobs = _.sortBy(response, 'createdAt').reverse()
      @renderSelectors '#careers'

  afterRender: ->
    super(arguments...)
    @$('#fixed-nav').affix({
      offset:
        top: ->
          $('#nav-container').offset().top
    })
    #TODO: Maybe cache top value between page resizes to save CPU
    $('body').scrollspy(
      target: '#nav-container'
      offset: 150
    )
    @$('#screenshot-lightbox').modal()

    @$('#screenshot-carousel').carousel({
      interval: 0
      keyboard: false
    })

  afterInsert: ->
    super()
    # scroll to the current hash, once everything in the browser is set up
    f = =>
      return if @destroyed
      link = $(document.location.hash)
      if link.length
        @scrollToLink(document.location.hash, 0)
    _.delay(f, 100)

  onClickFixedNavLink: (event) ->
    event.preventDefault() # prevent default page scroll
    link = $(event.target).closest('a')
    target = link.attr('href')
    history.replaceState(null, null, "about#{target}") # update hash without triggering page scroll
    @scrollToLink(target)

  onRightPressed: (event) ->
    # Special handling, otherwise after you click the control, keyboard presses move the slide twice
    return if event.type is 'keydown' and $(document.activeElement).is('.carousel-control')
    if $('#screenshot-lightbox').data('bs.modal')?.isShown
      event.preventDefault()
      $('#screenshot-carousel').carousel('next')

  onLeftPressed: (event) ->
    return if event.type is 'keydown' and $(document.activeElement).is('.carousel-control')
    if $('#screenshot-lightbox').data('bs.modal')?.isShown
      event.preventDefault()
      $('#screenshot-carousel').carousel('prev')

  onEscapePressed: (event) ->
    if $('#screenshot-lightbox').data('bs.modal')?.isShown
      event.preventDefault()
      $('#screenshot-lightbox').modal('hide')

  onClickScreenThumbnail: (event) ->
    unless $('#screenshot-lightbox').data('bs.modal')?.isShown
      event.preventDefault()
      # Modal opening happens automatically from bootstrap
      $('#screenshot-carousel').carousel($(event.currentTarget).data("index"))
