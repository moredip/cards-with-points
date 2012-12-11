window.global = window

$ ->
  return if window.PERFORMING_INTEGRATION_TESTS

  newCardView = new NewCardView
  newCardView.on 'create-card', -> console.log 'new card being added'


  global.createMainController
    newCardView:newCardView
    createCardModel: (args...)-> new Card(args...)
