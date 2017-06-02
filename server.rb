require 'sinatra'
require_relative 'recipe'

get '/' do
  redirect to ('/recipes')
end

get '/about' do
  erb :about
end

get '/contact_us' do
  erb :contact_us
end

get '/blog' do
  erb :blog
end

get '/recipes' do
  @recipes = Recipe.all
  erb :recipes
end

# Wild-Card Route.
# Always use params - a hash Sinatra gives you, containing the info in the URL,
# e.g. /recipes/2
get '/recipes/:id' do
  # 1. Retrieve the recipe.
  @recipe = Recipe.find(params[:id])
  # 2. Render a recipe page.
  erb :recipe
end
