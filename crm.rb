require_relative 'contact.rb'

class CRM

  def initialize


  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end

  end

  def add_new_contact
    print "Enter first Name:"
    first_name = gets.chomp
    print "Enter last Name:"
    last_name = gets.chomp
    print "Enter Email Address:"
    email = gets.chomp
    print "Enter a Note:"
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "What's first name?"
    first_name = gets.chomp
    finding = Contact.find_by("first name", first_name)

    puts "what attributes do you want to change?"
    attribute = gets.chomp
    puts "change to ?????"
    value = gets.chomp
    finding.update(attribute, value)

  end

  def delete_contact
    puts "what contact do you want to delete ?? please put first name"
    first_name = gets.chomp
    finding = Contact.find_by("first name", first_name)
    finding.delete
  end

  def display_all_contacts
    display = Contact.all.inspect
    puts display
  end

  def search_by_attribute
    puts "What attribute are you looking for ?"
    attribute = gets.chomp
    puts "And which one?"
    value = gets.chomp

    contact = Contact.find_by(attribute, value)
    puts contact.inspect
  end


end
#
# c =CRM.new("Bitmaker")
# puts c.display_all_contacts
# puts c.main_menu
