describe 'CardView', ->
  createView = ( model = new Card ) ->
    new CardView(model:model)

  it 'renders a div.card',->
    view = createView()
    expect( view.render().$el ).toBe('div.card')

  it 'renders the card text', ->
    model = new Card(text:'I <3 HTML!')
    view = createView( new Card(text:'I <3 HTML!') )
    expect( view.render().$el.find('p') ).toHaveText("I <3 HTML!")


  it 'renders the cards point vote', ->
    model = new Card(text:'I <3 HTML!')
    view = createView( new Card(vote:12) )
    expect( view.render().$el.find('.curr-vote') ).toHaveText("12")
