describe 'NewCardView', ->

  view = null

  beforeEach ->
    loadFixtures "index.html"
    view = new NewCardView

  it 'binds $el to the right DOM element', ->
    expect( view.$el ).toBe( 'section#new-card' )

  it 'fires a create-card event when the add card button is clicked', ->
    eventSpy = sinon.spy()
    view.on 'create-card', eventSpy

    $('section#new-card button').click()

    expect( eventSpy ).toHaveBeenCalled()
