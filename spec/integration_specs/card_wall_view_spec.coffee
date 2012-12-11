describe 'CardWallView', ->
  view = null
  model = new Backbone.Model

  beforeEach ->
    loadFixtures "index.html"

    view = new CardWallView( model: model )
    
  it 'binds the view el', ->
    expect( view.$el ).toBeDefined()
    expect( view.$el ).toExist()

  it 'renders the model title', ->
    model.set('title','the wall title')
    expect( $( '.title', view.$el ) ).toHaveText( 'the wall title' )
    
  it 'renders each card in the cards collection', ->

