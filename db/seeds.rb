# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

file = open(url).read
file_list = JSON.parse(file)
file_list['drinks'].each do |list|
  Ingredient.create!(name: list['strIngredient1'])
  end

