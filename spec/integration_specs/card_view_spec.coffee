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

  it "sets contenteditable based on its model's inEditState", ->
    model = new Card
    view = createView(model).render()

    $textPara = view.$el.find('p')
    expect( $textPara ).not.toHaveAttr('contenteditable')
    model.set('inEditState',true)
    expect( $textPara ).toHaveAttr('contenteditable')
    model.set('inEditState',false)
    expect( $textPara ).not.toHaveAttr('contenteditable')

  it "sets editing class based on the its model's inEditState", ->
    model = new Card
    view = createView(model).render()

    expect(view.$el).not.toHaveClass('editing')
    model.set('inEditState',true)
    expect(view.$el).toHaveClass('editing')
    model.set('inEditState',false)
    expect(view.$el).not.toHaveClass('editing')


  it 'tells its model when its text was clicked', ->
    fakeModel = new Card()
    fakeModel.textClicked = sinon.spy()
    view = createView(fakeModel)

    view.render().$el.find('p').click()

    expect( fakeModel.textClicked ).toHaveBeenCalled()

  it 'updates its model whenever its text is editted', ->
    model = new Card()
    view = createView(model).render()

    view.$el.find('p')
      .click()
      .text('new text <3 content')
      .trigger('input')

    expect( model.get('text') ).toEqual('new text <3 content')
