require './spec_helper'

describe '123', ->
  it 'should work', ->
    expect(1+2).toEqual(3)

describe Card, ->
  it 'should be defined', ->
    expect( Card ).not.toBeUndefined()

  it 'should look like a BB model', ->
    card = new Card
    expect( _.isFunction(card.get) ).toBe(true)
