/* global Vue, Rails */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      messages: [],
      newMessageBody: ""
    },
    mounted: function() {
      Rails.ajax({
        url: "/api/v1/messages",
        type: "get",
        success: function(response) {
          this.messages = response;
        }.bind(this)
      });
    },
    methods: {
      createMessage: function() {
        Rails.ajax({
          url: "/api/v1/messages",
          type: "post",
          data: "body=" + this.newMessageBody,
          success: function(response) {
            this.messages.unshift(response);
            this.newMessageBody = "";
          }.bind(this)
        });
      }
    },
    computed: {

    }
  });
});
