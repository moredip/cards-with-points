global.Card = Backbone.Model.extend
  foo: -> 'asdf'

global.NewCardView = Backbone.View.extend
  el: "section#new-card"

  events:
    "click button": "onClickButton"

  onClickButton: ->
    @trigger( 'create-card', @ )

  getText: ->
    @$('textarea').val()


global.createMainController = ({newCardView,cardsCollection})->
  newCardView.on 'create-card', ->
    cardsCollection.add
      text: newCardView.getText()


