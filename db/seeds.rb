# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ name: 'cat' }, { name: 'dog' }, { name: 'lion' },
                 { name: 'fish' }])
Tag.create([{ name: 'cat' }, { name: 'dog' }, { name: 'lion' },
            { name: 'fish' }])
User.create(username: 'test', email: 'test@test')
User.create(username: 'test1', email: 'test@test1')
User.create(username: 'test2', email: 'test@test2')
User.create(username: 'test3', email: 'test@test3')
Pet.create(name: 'jack1', tag_id: 1, category_id: 1, user_id: 1)
Pet.create(name: 'jack2', tag_id: 1, category_id: 1, user_id: 1)
Pet.create(name: 'jack3', tag_id: 1, category_id: 1, user_id: 1)
Pet.create(name: 'jack4', tag_id: 1, category_id: 1, user_id: 1)
Pet.create(name: 'jack5', tag_id: 1, category_id: 1, user_id: 1)
