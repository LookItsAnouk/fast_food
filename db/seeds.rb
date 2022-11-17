Recipe.destroy_all
# Review.destroy_all
# Rating.destroy_all
# Order.destroy_all
User.destroy_all



# reviews = Review.all
# ratings = Rating.all
# orders = Order.all



# Recipes

50.times do

created_at = Faker::Date.backward(days: 365 * 5)
price = rand(10.50..20.50)

r = Recipe.create(
    title:Faker::Food.dish,
    ingredients: Faker::Food.ingredient,
    description: Faker::Food.description,
    image_url: 'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
    price: price,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
)
end

recipes = Recipe.all


# ---------------------------------------------

# Reviews

# ---------------------------------------------

# Ratings

# ---------------------------------------------

# Orders

# ---------------------------------------------

# Users

 PASSWORD = '123456789'



10.times do

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    address = Faker::Address.full_address
    phone = Faker::PhoneNumber.cell_phone
    

    u = User.create(
        first_name: first_name,
        last_name: last_name,
        address: address,
        phone: phone,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD,
        is_cook?: false

    )
    puts u.errors.full_messages

end

10.times do

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    address = Faker::Address.full_address
    phone = Faker::PhoneNumber.cell_phone
    

    uu = User.create(
        first_name: first_name,
        last_name: last_name,
        address: address,
        phone: phone,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD,
        is_cook?: true
    )
    puts uu.errors.full_messages
end

users = User.all

# ---------------------------------------------



puts Cowsay.say("Generated #{recipes.count} recipes.", :elephant)
# puts Cowsay.say("Generated #{reviews.count} comments.", :frogs)
# puts Cowsay.say("Generated #{ratings.count} users.", :dragon)
# puts Cowsay.say("Generated #{orders.count} users.", :Kitty)
puts Cowsay.say("Generated #{users.count} users.", :Koala)