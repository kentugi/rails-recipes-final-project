
RecipeIngredient.destroy_all
Bookmark.destroy_all
Comment.destroy_all
Review.destroy_all
Recipe.destroy_all
User.destroy_all
Ingredient.destroy_all

puts 'Creating 50 fake data...'
15.times do
  recipe = Recipe.new(
    title: Faker::Food.dish,
    description: Faker::Food.description,
    instruction: Faker::Food.measurement,
    prep_time: rand(1..40),
    cook_time: rand(1..120),
    image: "https://picsum.photos/300/200"
  )
  recipe.total_time = (recipe.prep_time + recipe.cook_time)
  recipe.save!
end

user = User.new(
  name: Faker::Name.name,
  email: "one@test.com",
  password: "123456789"
)
user.save!
user_two = User.new(
  name: Faker::Name.name,
  email: "two@test.com",
  password: "123456789"
)
user_two.save!

10.times do
  bookmark = Bookmark.new(
    recipe: Recipe.last,
    user: user
  )
  bookmark.save
end

500.times do
  list = [Faker::Food.ingredient, Faker::Food.fruits, Faker::Food.vegetables, Faker::Food.spice]
  ingredient = Ingredient.new(
    label: list.sample
  )
  ingredient.save
end

10.times do
  comment = Comment.new(
    remarks: Faker::Lorem.sentence(word_count: 3),
    recipe: Recipe.last,
    user: user
  )
  comment.save!
end

10.times do
  review = Review.new(
    header: Faker::Restaurant.type,
    body: Faker::Restaurant.review,
    rating: rand(1..5),
    recipe: Recipe.last,
    user: user
  )
  review.save!
end


Ingredient.all.each do |i|
  ri = RecipeIngredient.new(
    recipe: Recipe.all.sample,
    ingredient: i
  )
  ri.save
end

puts 'Finished!'
