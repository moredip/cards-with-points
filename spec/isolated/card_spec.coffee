require './spec_helper'

describe Card, ->
  it 'should be defined', ->
    expect( Card ).not.toBeUndefined()

  it 'should look like a BB model', ->
    card = new Card
    expect( _.isFunction(card.get) ).toBe(true)

  it "should handle it's text being clicked by publishin an event", ->
    card = new Card
    eventSpy = sinon.spy()
    card.on 'text-edit-requested', eventSpy

    card.textClicked()

    expect(eventSpy).toHaveBeenCalledWith( card )
    
