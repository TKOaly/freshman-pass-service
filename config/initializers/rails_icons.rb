RailsIcons.configure do |config|
  # Set the default set for the library
  config.default_library = "heroicons" # https://heroicons.com/
  config.default_set = "outline" # other sets for Heroicons are: solid, mini, micro

  config.libraries.heroicons.outline.default.css = "icon"
  config.libraries.heroicons.outline.default.stroke_width = "1.5"
  config.libraries.heroicons.outline.default.data = {}
end
