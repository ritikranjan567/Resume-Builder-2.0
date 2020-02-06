module ResumeBuilder
  class User
    self.extend Validation
    attr_accessor :first_name, :last_name, :gender, :age, :phone

    def initialize(first_name = "", last_name = "", gender = "", age = 0, phone = "")
      @first_name = first_name
      @last_name = last_name
      @gender = gender
      @age = age
      @phone = phone
    end

    #def valid_user?
    #  valid_name?(@first_name) &&
    #  valid_name?(@last_name) &&
    #  valid_gender?(@gender) &&
    #  valid_age?(@age) &&
    #  valid_phone_number?(@phone)
    #end

    def self.get_first_name
      name = ""
      while true do
        print "First Name: "
        name = gets.strip
        break if valid_name?(name)
      end
      return name
    end

    def self.get_last_name
      name = ""
      while true do
        print "Last Name: "
        name = gets.strip
        break if valid_name?(name)
      end
      return name
    end

    def self.get_gender
      gender = ""
      while true do
        print "Gender: "
        gender = gets.strip
        break if valid_gender?(gender)
      end
      return gender
    end

    def self.get_age
      age = 0
      while true do
        print "Age: "
        age = gets.strip.to_i
        break if valid_age?(age)
      end
      return age
    end

    def self.get_phone
      phone = ""
      while true do
        print "10 digit Mobile Number: "
        phone = gets.strip
        break if valid_phone_number?(phone)
      end
      return phone
    end

    def data_array
      user_data = Array.new
      user_data << @first_name << @last_name << @gender << @age << @phone
      return user_data
    end

    def hash
      @phone.hash
    end

    def ==(other_user)
      self.hash == other_user.hash
    end

    def eql?(other_user)
      self == other_user
    end

  end
end