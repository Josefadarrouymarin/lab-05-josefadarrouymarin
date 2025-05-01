puts "Creating users..."
users = 10.times.map do |i|
  User.create!(
    email: "user#{i}@example.com",
    first_name: "First#{i}",
    last_name: "Last#{i}"
  )
end

puts "Creating chats..."
chats = 10.times.map do
  Chat.create!(
    sender_id: users.sample.id,
    receiver_id: users.sample.id
  )
end

puts "Creating messages..."
10.times do
  Message.create!(
    chat_id: chats.sample.id,
    user_id: users.sample.id,
    body: "This is a test message"
  )
end

puts "Done seeding!"
