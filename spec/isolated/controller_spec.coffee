describe 'main controller', ->
  it 'adds a new card each time the new card view fires a create-card event', ->
    fakeNewCardView = _.extend({
      getText: -> 'fake new card text'
    },Backbone.Events)

    spyCollection = 
      add: sinon.spy()

    global.createMainController( newCardView:fakeNewCardView, cardsCollection: spyCollection )

    fakeNewCardView.trigger('create-card')
    expect(spyCollection.add.called).toBe(true)

    cardAttributes = spyCollection.add.args[0][0]
    expect( cardAttributes ).toEqual( text: 'fake new card text' )
