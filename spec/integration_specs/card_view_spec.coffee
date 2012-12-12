describe 'CardView', ->
  view = null
  model = null
  beforeEach ->
    model = new Backbone.Model
    view = new CardView(model:model)

  it 'renders a div.card',->
    expect( view.render().$el ).toBe('div.card')
    

