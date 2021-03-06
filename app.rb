require 'rubygems'
require 'compass' #must be loaded before sinatra
require 'sinatra'
require 'sass'    #must be loaded after sinatra
require 'haml'

# set sinatra's variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, "views"
set :public_folder, 'static'

Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.config'))

# at a minimum, the main sass file must reside within the ./views directory. here, we create a ./views/stylesheets directory where all of the sass files can safely reside.
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end

get '/' do
  haml :index
end
