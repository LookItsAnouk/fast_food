Recipe.destroy_all
Review.destroy_all
# Rating.destroy_all
Order.destroy_all
User.destroy_all


recipes = Recipe.all
reviews = Review.all
# ratings = Rating.all
orders = Order.all
users = User.all

# Ratings

# ---------------------------------------------



# Users

 PASSWORD = '123456789'



30.times do

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    address = Faker::Address.full_address
    phone = Faker::PhoneNumber.cell_phone
    

    User.create(
        first_name: first_name,
        last_name: last_name,
        address: address,
        phone: phone,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD,
        is_cook?: false

    )
    

end

20.times do

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    address = Faker::Address.full_address
    phone = Faker::PhoneNumber.cell_phone
    

    User.create(
        first_name: first_name,
        last_name: last_name,
        address: address,
        phone: phone,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD,
        is_cook?: true
    )
    
end

# ---------------------------------------------

# Recipes and Reviews

50.times do

created_at = Faker::Date.between(from: 30.days.ago, to: Date.today)
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
    if r.valid?
        rand(1..5).times do
            Review.create(body: Faker::Hipster.paragraphs, recipe: r, user: users.sample)
        end

    end

    if r.valid?

        delivery_date = Faker::Date.between(from: '2022-11-30', to: '2022-12-05')
        created_at = Faker::Date.between(from: 5.days.ago, to: Date.today)

        rand(1..10).times do
            Order.create(
                payment_type: 'cash',
                delivery_type: 'pickup',
                delivery_date: delivery_date,
                created_at: created_at,
                updated_at: created_at,
                user: users.sample,
                recipe: r,
                pending?: false,
                approved?: true
            )
        end
    end

end

# ---------------------------------------------

# Orders



# ---------------------------------------------

puts Cowsay.say("Generated #{recipes.count} recipes.", :elephant)
puts Cowsay.say("Generated #{reviews.count} reviews.", :frogs)
# puts Cowsay.say("Generated #{ratings.count} users.", :dragon)
puts Cowsay.say("Generated #{orders.count} orders.", :Kitty)
puts Cowsay.say("Generated #{users.count} users.", :Koala)