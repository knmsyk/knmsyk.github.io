require './lib/app'
map App.assets_prefix do
  run App.sprockets
end
run App
