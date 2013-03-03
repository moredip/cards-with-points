describe 'CardView', ->
  createView = ( model = new Card ) ->
    new CardView(model:model)

  it 'renders a div.card',->
    view = createView()
    expect( view.render().$el ).toBe('div.card')

  it 'renders the card text', ->
    view = createView( new Card(text:'I <3 HTML!') )
    expect( view.render().$el.find('p') ).toHaveText("I <3 HTML!")

  it 'renders the cards point vote', ->
    view = createView( new Card(vote:12) )
    expect( view.render().$el.find('.curr-vote') ).toHaveText("12")

  it 'sets contenteditable based on its models inEditState', ->
    model = new Card
    view = createView(model)
    view.render()

    expect(view.$el.find('p').attr('contenteditable')).not.toBeDefined()
    model.set('inEditState',true)
    expect(view.$el.find('p').attr('contenteditable')).toBeDefined()
    model.set('inEditState',false)
    expect(view.$el.find('p').attr('contenteditable')).not.toBeDefined()


  it 'tells its model when its text was clicked', ->
    fakeModel = new Card()
    fakeModel.textClicked = sinon.spy()
    view = createView(fakeModel)

    view.render().$el.find('p').click()

    expect( fakeModel.textClicked ).toHaveBeenCalled()
