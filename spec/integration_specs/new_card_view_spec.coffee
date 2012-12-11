describe 'NewCardView', ->

  view = null

  beforeEach ->
    loadFixtures "index.html"
    view = new NewCardView

  it 'binds $el to the right DOM element', ->
    expect( view.$el ).toBe( 'section#new-card' )

  it 'fires a create-card event when the add card button is clicked', ->
    view.on( 'create-card', eventSpy = sinon.spy() )

    $('section#new-card button').click()

    expect( eventSpy ).toHaveBeenCalledWith( view )

  it 'exposes the text area text', ->
    $('section#new-card textarea').val('I AM A NEW CARD')
    expect( view.getText() ).toBe( 'I AM A NEW CARD' )
