describe 'CardView', ->
  view = null
  model = null
  beforeEach ->
    model = new Backbone.Model
    view = new CardView(model:model)

  it 'renders a div.card',->
    expect( view.render().$el ).toBe('div.card')
    

  it 'renders the card text', ->
    model = new Card(text:'I <3 HTML!')
    view = new CardView(model:model)
    expect( view.render().$el.find('p') ).toHaveText("I <3 HTML!")


