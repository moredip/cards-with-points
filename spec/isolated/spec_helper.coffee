global.Handlebars = require 'handlebars'
global._ = require 'underscore'
global.Backbone = require 'backbone'
global.sinon = require 'sinon'

global.window = global
require '../../public/vendor/jasmine-sinon'
delete window

require '../../public/app'
