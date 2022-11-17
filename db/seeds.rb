# Recipe.destroy_all
# Review.destroy_all
# Rating.destroy_all
# Order.destroy_all
User.destroy_all

# Recipes

# ---------------------------------------------

# Reviews

# ---------------------------------------------

# Ratings

# ---------------------------------------------

# Orders

# ---------------------------------------------

# Users

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  address = Faker::Address.full_address
  phone = Faker::PhoneNumber.cell_phone
  password = '123'



10.times do
    

    User.create(
        first_name: first_name,
        last_name: last_name,
        address: address,
        phone: phone,
        email: "#{first_name}@#{last_name}.com",
        password: password,
        is_cook?: false
    )
end

10.times do

    User.create(
        first_name: first_name,
        last_name: last_name,
        address: address,
        phone: phone,
        email: "#{first_name}@#{last_name}.com",
        password: password,
        is_cook?: true
    )
end

# ---------------------------------------------

# recipes = Recipe.all
# reviews = Review.all
# ratings = Rating.all
# orders = Order.all
users = User.all

# puts Cowsay.say("Generated #{recipes.count} posts.", :elephant)
# puts Cowsay.say("Generated #{reviews.count} comments.", :frogs)
# puts Cowsay.say("Generated #{ratings.count} users.", :dragon)
# puts Cowsay.say("Generated #{orders.count} users.", :Kitty)
puts Cowsay.say("Generated #{users.count} users.", :Koala)