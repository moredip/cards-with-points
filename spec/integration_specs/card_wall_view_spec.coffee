describe 'CardWallView', ->
  view = null
  model = null

  beforeEach ->
    loadFixtures "index.html"

    model = new CardWall
    view = new CardWallView( model: model )
    
  it 'binds the view el', ->
    expect( view.$el ).toBeDefined()
    expect( view.$el ).toExist()

  it 'renders the model title', ->
    model.set('title','the wall title')
    expect( view.$el.find('.title') ).toHaveText( 'the wall title' )
    
  it 'renders each card in the cards collection', ->
    model.addCard(text:"card one")
    model.addCard(text:"card two")
    expect( view.$el.find('.card').size() ).toBe(2)

