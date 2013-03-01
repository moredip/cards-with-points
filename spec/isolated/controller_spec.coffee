describe 'main controller', ->
  it 'reacts to a create-card event by creating a new card in the card wall', ->
    fakeNewCardView = _.extend( {getText: -> 'text from new card'}, Backbone.Events )
    fakeCardWall = _.extend({
      addCard: sinon.spy()
    })

    global.createMainController( newCardView:fakeNewCardView, cardWall: fakeCardWall )

    fakeNewCardView.trigger('create-card',fakeNewCardView)
    expect(fakeCardWall.addCard).toHaveBeenCalledWith(text:'text from new card')
