window.global = window

$ ->
  return if window.PERFORMING_INTEGRATION_TESTS

  newCardView = new NewCardView
  newCardView.on 'create-card', -> console.log 'new card being added'

  cardWall = new CardWall
  cardWallView = new CardWallView(model:cardWall)

  cardWall.addCard(text:'a sample card to get you going',vote:-1)
  cardWall.addCard(text:'another card with some text',vote:3)

  global.createMainController
    newCardView:newCardView
    cardWall: cardWall
