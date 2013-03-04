global.Card = Backbone.Model.extend
  defaults:
    inEditState: false

  textClicked: -> @trigger('text-edit-requested',@)

global.Cards = Backbone.Collection.extend
  model: Card

global.CardWall = Backbone.Model.extend
  defaults:
    title: 'My Card Wall'
    cards: new Cards

  initialize: ->
    cards = @get('cards')
    cards.on 'text-edit-requested', (requestedCard)->
      cards.invoke('set','inEditState',false)
      requestedCard.set('inEditState',true)

  addCard: (args)->
    @get('cards').add( args )
    @trigger('change:cards')

global.CardView = Backbone.View.extend
  tagName: 'div'
  className: 'card'
  
  events:
    "click p": "onClickText"
    "input p": "onChangeText"

  template: Handlebars.compile """
    <div class="curr-vote">{{vote}}</div>
    <p>{{text}}</p>
  """

  initialize: ->
    @model.on( 'change:inEditState', @updateEditState, @ )

  render: ->
    @$el.html( @template(@model.toJSON()) )
    @updateEditState
    @

  updateEditState: ->
    editing = @model.get('inEditState')
    @$el.toggleClass('editing',editing)

    if editing
      @$textPara().attr('contenteditable', '')
    else
      @$textPara().removeAttr('contenteditable')

  onClickText: ->
    @model.textClicked()

  onChangeText: ->
    @model.set('text',@$textPara().text())

  $textPara: ->
    @$el.find('p')


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



global.createCardStore = (localStorage=window.localStorage)->
  save = (cards)->
    json = JSON.stringify(cards.toJSON())
    localStorage.setItem('cards',json)
  load = ()->
    json = localStorage.getItem('cards') || "[]"
    new global.Cards( JSON.parse(json) )

  { save, load }
