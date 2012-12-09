guard 'coffeescript', input: '.', output:'public'

guard 'haml', input: '.', output:'public' do
  watch(/^.+(\.html\.haml)/)
end

guard 'sass',
  #:input => 'bundle/stylesheets/sass',
  #:output => 'bundle/stylesheets/css',
  :smart_partials => true,
  #:load_paths => ['bundle/stylesheets/sass'],
  :style => :compressed
