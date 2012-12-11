window.global = window

$ ->
  newCardView = new NewCardView
  newCardView.on 'create-card', -> console.log 'new card being added'


  global.createMainController
    newCardView:newCardView
    createCardModel: (args...)-> new Card(args...)
