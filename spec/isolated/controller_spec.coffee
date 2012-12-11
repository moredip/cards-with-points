describe 'main controller', ->
  it 'adds a new card to the card wall each time the new card view fires a create-card event', ->
    fakeNewCardView = _.extend({
      getText: -> 'fake new card text'
    },Backbone.Events)

    fakeCardWall = _.extend({
      addCard: sinon.spy()
    })

    global.createMainController( newCardView:fakeNewCardView, cardWall: fakeCardWall )

    fakeNewCardView.trigger('create-card')
    expect(fakeCardWall.addCard.called).toBe(true)

    cardAttributes = fakeCardWall.addCard.args[0][0]
    expect( cardAttributes ).toEqual( text: 'fake new card text' )
