global.Card = Backbone.Model

global.Cards = Backbone.Collection

global.CardWall = Backbone.Model.extend
  defaults:
    title: 'Card Wall'
    cards: new Cards

  addCard: (args)->
    @get('cards').add( args )
    @trigger('change:cards')

global.CardView = Backbone.View.extend
  tagName: 'div'
  className: 'card'

  template: Handlebars.compile """
    <div class="curr-vote">{{vote}}</div>
    <p>{{text}}</p>
  """

  render: ->
    @$el.html( @template(@model.toJSON()) )
    @

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
    @model.on 'change:cards', @refreshCards, @

    @render()
    @refreshCards()

  render: ->
    @$el.find( '.title' ).text( @model.get('title') )
    @el

  refreshCards: ->
    @$el.find( '.card' ).remove()
    container = @el
    @model.get('cards').each (card) ->
      (new CardView(model:card)).render().$el.appendTo(container)

global.createMainController = ({newCardView,cardWall})->
  newCardView.on 'create-card', ->
    cardWall.addCard
      text: newCardView.getText()


