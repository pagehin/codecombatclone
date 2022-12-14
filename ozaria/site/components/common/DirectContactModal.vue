<script>
  import ModalDivider from './ModalDivider'
  import Modal from './Modal'
  const zendesk = require('core/services/zendesk')

  export default Vue.extend({
    components: {
      ModalDivider,
      Modal
    },
    data: () => ({
      zendeskError: null
    }),
    methods: {
      programaticallyClose () {
        // Because this modal is created from Backbone, we don't have a clean way to
        // close the modal other than interacting with data-dismiss='modal' through clicking.
        $('#ozaria-modal-header-close-button').click()
      },
      showError (error) {
        console.error(error)
        noty({
          text: 'Unable to load chat (may be due to browser privacy features)',
          layout: 'topCenter',
          type: 'error',
          timeout: 5000
        })
      },
      clickedSalesChat () {
        try {
          window.tracker.drift.openChat()
          this.programaticallyClose()
          window.tracker.trackEvent('Sales chat opened')
        } catch (e) {
          this.showError(e)
        }
      },
      clickedSupportChat () {
        try {
          window.tracker.drift.startInteraction({ interactionId: 135698 })

          this.programaticallyClose()
          window.tracker.trackEvent('Support chat opened')
        } catch (e) {
          this.showError(e)
        }
      },
      clickedEmail () {
        zendesk.loadZendesk().then(() => {
          try {
            zE('webWidget', 'prefill', {
              email: {
                value: me.get('email')
              }
            })
            zE('webWidget', 'open')
            zE('webWidget', 'show')
            this.programaticallyClose()
            window.tracker.trackEvent('Support email opened')
          } catch (e) {
            this.showError(e)
            this.zendeskError = true
          }
        })
      }
    }
  })
</script>

<template>
  <modal
      :backbone-dismiss-modal="true"
      :title="$t('general.contact_us')"
  >
    <div class="flex-container column">
      <p>{{ $t("general.chat_with_us") }} (9am-6pm ET)</p>
      <div class="flex-container">
        <div class="flex-container column">
          <button @click.prevent="clickedSupportChat" class="btn btn-large btn-primary btn-moon">{{ $t("general.support") }}</button>
        </div>

        <div class="flex-container column">
          <button @click.prevent="clickedSalesChat" class="btn btn-large btn-primary btn-moon">{{ $t("general.sales") }}</button>
        </div>
      </div>

      <modal-divider />

      <div v-if="zendeskError">
        {{ $t('general.email_us') }}: <a href="mailto:support@ozaria.com">support@ozaria.com</a>
      </div>
      <div v-else class="flex-container column">
        <p>{{ $t("general.email_us") }}</p>
        <button @click.prevent="clickedEmail" class="btn btn-large btn-primary btn-moon">{{ $t("general.email") }}</button>
      </div>
    </div>
  </modal>
</template>

<style lang="scss" scoped>
@import "ozaria/site/styles/common/variables.scss";

.flex-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}

.column {
  flex-direction: column;
}

// These types of buttons could be shared better
.btn-primary.btn-moon {
  background-color: $moon;
  border-radius: 1px;
  color: $gray;
  text-shadow: unset;
  font-weight: bold;
  @include font-h-5-button-text-black;
  min-width: 260px;
  padding: 15px 0;
  background-image: unset;
  margin: 0 15px;

  &:hover {
    @include font-h-5-button-text-white;
    background-color: $goldenlight;
    transition: background-color .35s;
  }
}
</style>
