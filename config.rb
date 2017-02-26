activate :automatic_image_sizes
activate :directory_indexes
activate :relative_assets

set :fonts_dir, 'fonts'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :gzip
end

helpers do
  def svg(name)
    root = Middleman::Application.root
    file_path = "#{root}/source/images/#{name}.svg"
    return File.read(file_path) if File.exists?(file_path)
    '(not found)'
  end

  def palette
    uri = URI.parse("https://kauntaa-api.herokuapp.com/v1/palettes/sample")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
