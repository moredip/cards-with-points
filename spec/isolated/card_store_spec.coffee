describe 'CardStore', ->
  fakeLocalStorage = cards = store = undefined
  emptyCards = -> new global.Cards()

  createFakeLocalStorage = ->
    underlying = {}
    {
      setItem: (k,v)-> underlying[k] = v
      getItem: (k)-> underlying[k]
      keys: ()-> _.keys( underlying )
    }

  beforeEach ->
    fakeLocalStorage = createFakeLocalStorage()
    store = global.createCardStore(fakeLocalStorage)


  describe ".save", ->

    it 'saves to the cards key in local storage', ->
      cards = new global.Cards([
        { foo: 'bar' },
        { baz: 'chirp' }
      ])

      cardsJson = cards.toJSON()
      expect( cardsJson.length ).toBe(2)
      
      store.save( cards )

      expect( fakeLocalStorage.keys() ).toEqual( ['cards'] )


  describe '.load', ->
    it 'roundtrips back whatever cards were saved', ->
      origCards = new global.Cards([
        { foo: 'bar' },
        { baz: 'chirp' }
      ])

      store.save( origCards )

      reloadedCards = store.load()
      expect( reloadedCards.toJSON ).toEqual( origCards.toJSON )

    it 'handles a store with no cards', ->
      expect( fakeLocalStorage.getItem('cards') ).not.toBeDefined()
      loadedCards = store.load()
      expect( loadedCards.models ).toEqual( [] )
