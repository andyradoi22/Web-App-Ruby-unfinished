# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({
    email: "test1@wrimble.com",
    password: "password1",
    password_confirmation: "password1"
})

User.create({
    email: "test2@wrimble.com",
    password: "password2",
    password_confirmation: "password2"
})

7.times do
    Board.create({
        name: Faker::App.name,
        description: Faker::Lorem.sentence,
    })
end

@boards = Board.all
@boards.each do |board|
    3.times do
        column = board.columns.create(
            {
                title: Faker::App.name,
                order: Faker::Number.number(digits: 2)
            }
        )
    end
    @columns = Column.all
    @columns.each do |column|
        4.times do
            story = column.stories.create(
                {
                    task: Faker::App.name,
                    info: Faker::Restaurant.type,
                    order: Faker::Number.number(digits: 2),
                    tag: Faker::Color.color_name,
                    status: Faker::Subscription.status,
                    due: Faker::Date.forward(days: 23)
                }
            )
        end
    end
end