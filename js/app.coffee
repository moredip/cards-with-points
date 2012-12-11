global.Card = Backbone.Model

global.Cards = Backbone.Collection

global.CardWall = Backbone.Model.extend
  defaults:
    title: 'Card Wall'
    cards: new Cards

  addCard: (args)->
    @get('cards').add( args )


global.NewCardView = Backbone.View.extend
  el: "section#new-card"

  events:
    "click button": "onClickButton"

  onClickButton: ->
    @trigger( 'create-card', @ )

  getText: ->
    @$('textarea').val()


global.CardWallView = Backbone.View.extend
  el: "#card-wall"

  initialize: ->
    @model.on 'change', @render, @

  render: ->
    @$el.find( '.title' ).text( @model.get('title') )
    @

global.createMainController = ({newCardView,cardWall})->
  newCardView.on 'create-card', ->
    cardWall.addCard
      text: newCardView.getText()


