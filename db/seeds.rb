# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding db..."

JournalEntry.destroy_all
ClientProvider.destroy_all
Client.destroy_all
Provider.destroy_all

provider1 = Provider.create!(name: "Dr. Smith", email: "smith@health.com")
provider2 = Provider.create!(name: "Dr. Jones", email: "jones@wellness.com")

client1 = Client.create!(name: "Alice", email: "alice@example.com")
client2 = Client.create!(name: "Bob", email: "bob@example.com")
client3 = Client.create!(name: "Charlie", email: "charlie@example.com")

ClientProvider.create!(client: client1, provider: provider1, plan: "basic")
ClientProvider.create!(client: client1, provider: provider2, plan: "premium")
ClientProvider.create!(client: client2, provider: provider1, plan: "premium")
ClientProvider.create!(client: client3, provider: provider2, plan: "basic")

JournalEntry.create!(client: client1, content: "Had a great breakfast today!", created_at: 2.days.ago)
JournalEntry.create!(client: client1, content: "Tried intermittent fasting.", created_at: 1.day.ago)
JournalEntry.create!(client: client2, content: "Started keto diet.", created_at: 3.days.ago)
JournalEntry.create!(client: client3, content: "Feeling better after a week of healthy eating.", created_at: 1.hour.ago)

puts "Seeding Complete!"
