require('app/styles/teachers/share-licenses-modal.sass')
ModalView = require 'views/core/ModalView'
State = require 'models/State'
TrialRequests = require 'collections/TrialRequests'
forms = require 'core/forms'
store = require('core/store')
ShareLicensesStoreModule = require('./ShareLicensesStoreModule')

module.exports = class ShareLicensesModal extends ModalView
  id: 'share-licenses-modal'
  template: require 'app/templates/teachers/share-licenses-modal'
  events: {}
  initialize: (options={}) ->
    @shareLicensesComponent = null
    store.registerModule('modal', ShareLicensesStoreModule)
    store.dispatch('modal/setPrepaid', options.prepaid.attributes)
  afterRender: ->
    target = @$el.find('#share-licenses-component')
    if @shareLicensesComponent
      target.replaceWith(@shareLicensesComponent.$el)
    else
      @shareLicensesComponent = new ShareLicensesComponent({
        el: target[0]
        store
      })
      @shareLicensesComponent.$on 'setJoiners', (prepaidID, joiners) =>
        @trigger 'setJoiners', prepaidID, joiners
  destroy: ->
    @shareLicensesComponent.$destroy()
    super(arguments...)

ShareLicensesComponent = Vue.extend
  name: 'share-licenses-component'
  template: require('app/templates/teachers/share-licenses-component')()
  storeModule: ShareLicensesStoreModule
  data: ->
    me: me
    teacherSearchInput: ''
  computed: _.assign({}, Vuex.mapGetters(prepaid: 'modal/prepaid', error: 'modal/error', rawJoiners: 'modal/rawJoiners'))
  watch:
    teacherSearchInput: ->
      @$store.commit('modal/setError', '')
  components:
    'share-licenses-joiner-row': require('./ShareLicensesJoinerRow')
  methods:
    addTeacher: ->
      @$store.dispatch('modal/addTeacher', @teacherSearchInput).then =>
        # Send an event back to backbone-land so it can update its model
        @$emit 'setJoiners', @prepaid._id, @rawJoiners
    revokeJoiner: (prepaidID, joiner) ->
      @$store.dispatch('modal/revokeTeacher', {prepaidID: prepaidID, userID: joiner._id}).then =>
        @$emit 'setJoiners', prepaidID, @rawJoiners
    setJoinerMaxRedeemers: (prepaidID, joiner, maxRedeemers) ->
      @$store.dispatch('modal/setJoinerMaxRedeemers', {prepaidID: prepaidID, userID: joiner._id, maxRedeemers}).then =>
        @$emit 'setJoiners', prepaidID, @rawJoiners
  created: ->
  destroyed: ->
    @$store.commit('modal/clearData')
    @$store.unregisterModule('modal')
