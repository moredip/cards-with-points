describe 'CardWall', ->
  cardWall = null
  beforeEach ->
    cardWall = new CardWall

  it 'has a default title', ->
    expect( cardWall.get('title') ).toBe( 'Card Wall' )

  it 'has a cards collection', ->
    expect( cardWall.has('cards') ).toBe(true)
    expect( cardWall.get('cards').models ).toBeDefined()

