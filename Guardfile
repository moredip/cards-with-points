guard 'coffeescript', input:'js', output:'public'
guard 'coffeescript', input:'spec/integration_specs'

guard 'haml', input: '.', output:'public' do
  watch(/^[^\.].+(\.html\.haml)/)
end

guard 'sass',
  :input => 'stylesheets',
  :output => 'public/css',
  :smart_partials => true,
  :load_paths => ['stylesheets']
  #:style => :compressed
