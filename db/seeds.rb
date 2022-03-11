
RecipeIngredient.destroy_all
Bookmark.destroy_all
Comment.destroy_all
Review.destroy_all
Recipe.destroy_all
# User.destroy_all
Ingredient.destroy_all

# puts 'Creating 50 fake data...'
# 15.times do
#   recipe = Recipe.new(
#     title: Faker::Food.dish,
#     description: Faker::Food.description,
#     instruction: Faker::Food.measurement,
#     prep_time: rand(1..40),
#     cook_time: rand(1..120),
#     image: "https://picsum.photos/300/200"
#   )
#   recipe.total_time = (recipe.prep_time + recipe.cook_time)
#   recipe.save!
# end

# user = User.new(
#   name: Faker::Name.name,
#   email: "one@test.com",
#   password: "123456789"
# )
# user.save!
# user_two = User.new(
#   name: Faker::Name.name,
#   email: "two@test.com",
#   password: "123456789"
# )
# user_two.save!

# 10.times do
#   bookmark = Bookmark.new(
#     recipe: Recipe.last,
#     user: user
#   )
#   bookmark.save
# end

500.times do
  list = [Faker::Food.ingredient, Faker::Food.fruits, Faker::Food.vegetables, Faker::Food.spice]
  ingredient = Ingredient.new(
    label: list.sample
  )
  ingredient.save
end

# 10.times do
#   comment = Comment.new(
#     remarks: Faker::Lorem.sentence(word_count: 3),
#     recipe: Recipe.last,
#     user: user
#   )
#   comment.save!
# end

# 10.times do
#   review = Review.new(
#     header: Faker::Restaurant.type,
#     body: Faker::Restaurant.review,
#     rating: rand(1..5),
#     recipe: Recipe.last,
#     user: user
#   )
#   review.save!
# end

# ri = RecipeIngredient.new(
#   recipe: Recipe.first,
#   ingredient: Ingredient.first
# )
# ri.save

# puts 'Finished!'


require "open-uri"
require "nokogiri"

input = "pasta"
base_url = "https://www.loveandlemons.com/?s=#{input}&submit="
base_html_file = URI.open(base_url).read
base_html_doc = Nokogiri::HTML(base_html_file)

urls = []
base_html_doc.search(".to-the-recipe").each do |link| #holds the URL
  urls << link.attribute("href").value
end

# p urls

urls.each do |url|
  p url
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  # element = html_doc.search(".easyrecipe") || html_doc.search(".wprm-recipe-container")
  #   name = element.search(".ERSName") || element.search(".wprm-recipe-name wprm-block-text-bold")
  #   description = element.search(".ERSSummary") || element.search(".wprm-recipe-summary wprm-block-text-normal")
  #   ingredients = element.search(".ERSIngredients") || element.search(".wprm-recipe-ingredients")
  #   instruction = element.search(".ERSInstructions") || element.search(".wprm-recipe-instructions")
  #   prep_time = element.search(".ERSTime") || element.search(".wprm-recipe-prep-time-container")
  #   cook_time = element.search(".ERSTime ERSTimeRight") || element.search(".wprm-recipe-custom-time-container")
  #   total_time = element.search(".ERSTime ERSTimeRight")
  #   rating = element.search(".rating")

  element =  html_doc.search(".wprm-recipe-container")
  #  next if !element
    title = element.search(".wprm-recipe-name.wprm-block-text-bold")
    description = element.search(".wprm-recipe-summary.wprm-block-text-normal")
    ingredients = element.search(".wprm-recipe-ingredients .wprm-recipe-ingredient")
    instruction = element.search(".wprm-recipe-instructions")
    prep_time = element.search(".wprm-recipe-prep_time-minutes")
    cook_time = element.search(".wprm-recipe-details-minutes")
    # total_time = element.search(".ERSTime.ERSTimeRight")

    # rating = element.search(".rating")
    image = html_doc.search(".alignnone")

    # puts name.text.strip
    # puts description.text.strip
    recipe_ingredients = ingredients.map do |i|
      {
        unit: i.search(".wprm-recipe-ingredient-unit").text.strip,
        amount: i.search(".wprm-recipe-ingredient-amount").text.strip,
        label: i.search(".wprm-recipe-ingredient-name").text.strip
      }
    end
    # puts instruction.text.strip
    # puts prep_time.text.strip
    # puts cook_time.text.strip
    # puts total_time.text.strip
    # puts rating.text.strip
    # puts image.attribute("src").value
    # puts element.attribute("href").value
    p title.text.strip
    recipe = Recipe.new(
      title: title.text.strip,
      description: description.text.strip,
      instruction: instruction.text.strip,
      prep_time: prep_time.text.strip,
      cook_time: cook_time.text.strip,
      image: image.attribute("src").value
    )
    recipe.total_time = (recipe.prep_time + recipe.cook_time)
    recipe.save!

    recipe_ingredients.each do |ingredient|
      i = Ingredient.find_or_create_by(label: ingredient[:label].capitalize)

      RecipeIngredient.create!(
          recipe: recipe,
          ingredient: i
        )
    end
 end
