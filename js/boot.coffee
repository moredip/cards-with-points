window.global = window

$ ->
  return if window.PERFORMING_INTEGRATION_TESTS

  newCardView = new NewCardView
  newCardView.on 'create-card', -> console.log 'new card being added'

  cardStore = createCardStore() 
  cards = cardStore.load()

  cardWall = new CardWall( cards: cards )
  cardWallView = new CardWallView(model:cardWall)

  if cards.isEmpty()
    cards.add(text:'a sample card to get you going',vote:-1)
    cards.add(text:'another card with some text',vote:3)
    cardStore.save(cards)

  cards.on 'change add remove reset', ->
    cardStore.save(cards)

  global.createMainController
    newCardView:newCardView
    cardWall: cardWall
