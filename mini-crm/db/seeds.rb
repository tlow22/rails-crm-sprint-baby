# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Contact.destroy_all

# Create sample contacts
contacts = [
  {
    first_name: "John",
    last_name: "Doe",
    email: "john.doe@example.com",
    phone: "555-0101",
    company: "Tech Corp",
    tags: "lead,potential",
    next_follow_up_date: 1.week.from_now
  },
  {
    first_name: "Jane",
    last_name: "Smith",
    email: "jane.smith@example.com",
    phone: "555-0102",
    company: "Design Studio",
    tags: "client,active",
    next_follow_up_date: 3.days.from_now
  },
  {
    first_name: "Bob",
    last_name: "Johnson",
    email: "bob.johnson@example.com",
    phone: "555-0103",
    company: "Marketing Inc",
    tags: "prospect",
    next_follow_up_date: 2.weeks.from_now
  }
]

created_contacts = Contact.create!(contacts)

# Create sample notes for the contacts
created_contacts.each_with_index do |contact, index|
  contact.notes.create!([
    {
      content: "Initial contact meeting went well. Interested in our services.",
      pinned: true
    },
    {
      content: "Follow-up call scheduled for next week.",
      pinned: false
    }
  ])
end

puts "Created #{Contact.count} contacts with #{Note.count} notes"
