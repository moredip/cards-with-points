describe 'CardStore', ->
  it 'writes to localStorage whenever we store a card', ->
    fakeLocalStorage = {
      setItem: sinon.spy()
    }

    cards = new global.Cards()
    store = global.createCardStore(fakeLocalStorage)
    store.save( cards )

    expect( fakeLocalStorage.setItem ).toHaveBeenCalled()


  it 'saves the cards in localStorage with the right key'
