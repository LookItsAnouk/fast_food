
Recipe.destroy_all
Review.destroy_all
Rating.destroy_all
Order.destroy_all
Cook.destroy_all
User.destroy_all

users = User.all

PASSWORD = '123456789'
 
super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@admin.com",
    password: PASSWORD,
    is_cook: true
   
 )



30.times do


    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    address = Faker::Address.full_address
    phone = Faker::PhoneNumber.cell_phone
    boo = [true, false]
    

    u = User.create(
        first_name: first_name,
        last_name: last_name,
        address: address,
        phone: phone,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD,
        is_cook: boo.sample
    )
    
    if u.is_cook == true
        created_at = Faker::Date.between(from: 5.days.ago, to: Date.today)
        c = Cook.create(
            user_id: u.id,
            created_at: created_at,
            updated_at: created_at
        )
        if c.valid?
                score = rand(1..5)
                user = users.sample
                created_at = Faker::Date.between(from: 5.days.ago, to: Date.today)

                r = Rating.create(
                    rating: score,
                    user_id: user.id,
                    created_at: created_at,
                    updated_at: created_at,
                    cook_id: c.id
                )
                puts r.errors.full_messages
        end
    end
end
cooks = Cook.all
ratings = Rating.all
# ---------------------------------------------

# Recipes, Reviews and Orders

50.times do |n|

created_at = Faker::Date.between(from: 30.days.ago, to: Date.today)
price = rand(10.50..20.50)

r = Recipe.create(
    title:Faker::Food.dish,
    ingredients: Faker::Food.ingredient,
    description: Faker::Food.description,
    image_url: "https://loremflickr.com/640/640/meals?random=#{n + 1}",
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
                pending: false,
                approved: true
            )
        end
    end

end

orders = Order.all
recipes = Recipe.all
reviews = Review.all

puts Cowsay.say("Generated #{recipes.count} recipes.", :elephant)
puts Cowsay.say("Generated #{reviews.count} reviews.", :frogs)
puts Cowsay.say("Generated #{cooks.count} cooks.", :dragon)
puts Cowsay.say("Generated #{ratings.count} ratings.", :cow)
puts Cowsay.say("Generated #{orders.count} orders.", :Kitty)
puts Cowsay.say("Generated #{users.count} users.", :Koala)