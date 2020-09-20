# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

t1 = Transaction.create(t_type: "shopping", amount: 1000, parent: nil, transaction_id: 1)

#parent is t1
t2 = Transaction.create(t_type: "shopping", amount: 1000, parent: t1, transaction_id: 2)
t3 = Transaction.create(t_type: "car", amount: 1000, parent: t1, transaction_id: 3)

#parent is t2
t4 = Transaction.create(t_type: "car", amount: 1000, parent: t2, transaction_id: 4)
t5 = Transaction.create(t_type: "mobile", amount: 1000, parent: t2, transaction_id: 5)

t6 = Transaction.create(t_type: "mobile", amount: 1000, parent: nil, transaction_id: 6)
t7 = Transaction.create(t_type: "fruit", amount: 1000, parent: t6, transaction_id: 7)
