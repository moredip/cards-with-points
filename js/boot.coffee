window.global = window


$ ->
  return if window.PERFORMING_INTEGRATION_TESTS

  $('body').click ->
    Backbone.trigger('background-clicked')

  newCardView = new NewCardView
  newCardView.on 'create-card', -> console.log 'new card being added'

  cardStore = createCardStore() 
  cards = cardStore.load()

  if cards.isEmpty()
    cards.add(text:'a sample card to get you going')
    cards.add(text:'another card with some text')

  cardWall = new CardWall( cards: cards )
  cardWallView = new CardWallView(model:cardWall)

  cards.on 'change add remove reset', ->
    cardStore.save(cards)

  global.createMainController
    newCardView:newCardView
    cardWall: cardWall




