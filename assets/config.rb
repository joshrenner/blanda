require 'compass-recipes'
require 'normalize'

environment = :production

sass_options = {:debug_info => false}
preferred_syntax = :sass

http_path = "/assets/"
css_dir = "css"
sass_dir = "src/sass"
images_dir = "img"
javascripts_dir = "js"
fonts_dir = "fonts"
output_style = (environment == :production) ? :compressed : :nested