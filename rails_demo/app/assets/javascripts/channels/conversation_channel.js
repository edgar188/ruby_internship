//= require action_cable
//= require_self
//= require_tree .

window.onload = function () {
  (function () {
    this.App || (this.App = {});
    App.cable = ActionCable.createConsumer();
  }.call(this));

  $(function () {
    $('[data-channel-subscribe="conversation"]').each(function (index, element) {
      let $element = $(element);
      let conversation_id = $element.data('conversation-id');

      messageTemplate = $('[data-role="message-template"]');
      $element.animate({ scrollTop: $element.prop('scrollHeight') }, 100);

      App.cable.subscriptions.create(
        {
          channel: 'ConversationChannel',
          conversation: conversation_id,
        },
        {
          received: function (data) {
            render_new_message($element, data);
            $element.animate({ scrollTop: $element.prop('scrollHeight') }, 100);
          },
        }
      );
    });
  });
};