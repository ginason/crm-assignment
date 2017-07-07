class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id_number)
    @@contacts.each do |info|
      if info.id == id_number
        return info
      end
    end


  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    case attribute
    when "first name"
      self.first_name = value
      return self
    when "last name"
      self.last_name = value
      return self
    when "email"
      self.email = value
      return self
    when "note"
      self.note = value
      return self
    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    case attribute
    when "first name"
    @@contacts.each do |info|
      if info.first_name == value
        return info
      end
      end
    when "last name"
      @@contacts.each do |info|
        if info.last_name == value
          return info
        end
      end
    when "email"
      @@contacts.each do |info|
        if info.email == value
          return info
        end
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    return @@contacts.clear
  end



  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
    return @@contacts
  end

  # Feel free to add other methods here, if you need them.
  def full_name
    puts "#{first_name} #{last_name}"
  end


end
#
# betty=Contact.create("Betty", "Maker", "bettymakes@gmail.com", "Loves Pokemon")
# octo=Contact.create("Octo", "Cat", "octocat@github.com", "Is it an octopus? Is it a cat?")
# gian=Contact.create("Gina", "Son", "ginason@github.com", " Gina is busy")
# ryan=Contact.create("Ryan", "Kong", "ryan@gmail.com", "Ryan is working")

# # p Contact.find(1)
# # p Contact.find_by("Be", "Cat", "ginasun@gmail.com")
# # p Contact.find_by("email", "ginason@github.com")
# # puts "========================================"
# # p Contact.all
# # puts "========================================"
# p ryan.update("last name", "Son")
# puts "========================================"
#
# p ryan.delete
