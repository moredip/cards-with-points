describe 'CardWall', ->
  cardWall = null
  beforeEach ->
    cardWall = new CardWall

  it 'has a default title', ->
    expect( cardWall.get('title') ).toBe( 'Card Wall' )

  it 'has a cards collection', ->
    expect( cardWall.has('cards') ).toBe(true)
    expect( cardWall.get('cards').models ).toBeDefined()

  it 'can add cards to the cards collection', ->
    expect( cardWall.get('cards').isEmpty() ).toBe(true)
    cardWall.addCard( text: 'new card text' )
    expect( cardWall.get('cards').isEmpty() ).toBe(false)

    newCard = cardWall.get('cards').at(0)
    expect( newCard.get('text') ).toBe('new card text')

