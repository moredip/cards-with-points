describe 'CardWall', ->
  cards = cardWall = undefined
  beforeEach ->
    cards = new Cards
    cardWall = new CardWall({cards})

  it 'has a default title', ->
    expect( cardWall.get('title') ).toBe( 'My Card Wall' )

  it 'has a cards collection', ->
    expect( cardWall.has('cards') ).toBe(true)
    expect( cardWall.get('cards').models ).toBeDefined()

  it 'can add cards to the cards collection', ->
    expect( cardWall.get('cards').isEmpty() ).toBe(true)
    cardWall.addCard( text: 'new card text' )
    expect( cardWall.get('cards').isEmpty() ).toBe(false)

    newCard = cardWall.get('cards').at(0)
    expect( newCard.get('text') ).toBe('new card text')

  it 'fires a change:cards event when a card is added', ->
    eventSpy = sinon.spy()
    cardWall.on('change:cards',eventSpy)
    cardWall.addCard()
    expect( eventSpy.called ).toBe(true)

  it 'reacts to a card being asked to be edited by telling all other cards to conclude their editing', ->

    editStates = -> cards.pluck('inEditState')

    cards.add( [{},{},{},{}] )

    expect( editStates() ).toEqual( [false,false,false,false] )

    cards.at([2]).textClicked()

    expect( editStates() ).toEqual( [false,false,true,false] )

    cards.at([1]).textClicked()

    expect( editStates() ).toEqual( [false,true,false,false] )
