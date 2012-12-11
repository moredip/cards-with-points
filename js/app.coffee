global.NewCardView = Backbone.View.extend
  el: "section#new-card"

  events:
    "click button": "onClickButton"


  onClickButton: ->
    @trigger( 'create-card', @ )
