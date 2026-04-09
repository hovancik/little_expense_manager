# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

unless Rails.env.development?
  puts 'Seeds are only intended for development. Set FORCE_SEED=1 to override.'
  exit unless ENV['FORCE_SEED']
end

user = User.create!(
  email: 'demo@example.com',
  name: 'Demo User',
  password: 'password123',
  password_confirmation: 'password123',
  send_reports: true
)

account = Account.create!(name: 'Personal', description: 'Personal expenses')
user.accounts << account

groceries = Category.create!(name: 'Groceries', account: account, bucket_amount: 0)
transport = Category.create!(name: 'Transport', account: account, bucket_amount: 0)
dining = Category.create!(name: 'Dining Out', account: account, bucket_amount: 0)
utilities = Category.create!(name: 'Utilities', account: account, bucket_amount: 0)

[
  { category: groceries, amount: 45.50, note: 'Weekly groceries', paid_at: 8.days.ago },
  { category: groceries, amount: 32.75, note: 'Fruits and veggies', paid_at: 4.days.ago },
  { category: transport, amount: 15.00, note: 'Bus pass', paid_at: 7.days.ago },
  { category: dining, amount: 28.90, note: 'Dinner with friends', paid_at: 6.days.ago },
  { category: utilities, amount: 65.00, note: 'Electric bill', paid_at: 5.days.ago },
  { category: dining, amount: 12.50, note: 'Coffee shop', paid_at: 2.days.ago },
  { category: groceries, amount: 55.20, note: 'Costco run', paid_at: 1.day.ago },
  { category: transport, amount: 22.00, note: 'Uber ride', paid_at: 3.days.ago }
].each do |data|
  Expense.create!(
    category: data[:category],
    payer: user,
    account: account,
    amount: data[:amount],
    note: data[:note],
    paid_at: data[:paid_at],
    users_expenses_attributes: [{ user: user, amount: data[:amount] }]
  )
end

puts 'Seeded: demo@example.com / password123'
