describe 'NewCardView', ->
  beforeEach ->
    setFixtures """
      <section id="new-card">
      </section>
    """

  it 'exists', ->
    expect(NewCardView).toBeDefined()

  it 'binds $el to the right DOM element', ->
    view = new NewCardView
    expect( view.$el ).toBe( 'section#new-card' )
