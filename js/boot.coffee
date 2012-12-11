window.global = window

$ ->
  return if window.PERFORMING_INTEGRATION_TESTS

  newCardView = new NewCardView
  newCardView.on 'create-card', -> console.log 'new card being added'

  cardWall = new CardWall


  global.createMainController
    newCardView:newCardView
    cardWall: cardWall
