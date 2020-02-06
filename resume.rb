module ResumeBuilder
  require 'csv'
  class Resume
    attr_accessor :all_users

    def initialize
      begin
        users = CSV.read("user_data.csv")
      rescue          #in case user_data.csv not created yet
        file = CSV.open("user_data.csv", "a+")
        users = file.read
      end

      @all_users = Array.new
      users.each do |user|          #array of all Users
        @all_users.push(User.new(*user))
      end

    end

    def self.save_to_file(user)
      all_users = Resume.new.all_users    #List of all users
      if all_users.include? user      #check unique user (phone number as ID)
        puts "User with same mobile number exist, put data again.."
        self.build
        return nil
      end

      file = CSV.open("user_data.csv", "a")
      file << user.data_array
      puts "saved.."
      file.close

    end

    def self.build

      first_name = User.get_first_name
      last_name = User.get_last_name
      gender = User.get_gender
      age = User.get_age
      phone = User.get_phone

      user_data = User.new(first_name, last_name, gender, age, phone)

      #if !user_data.valid_user?
      #  puts "ERROR: Please follow above instruction.."
      #  self.build
      #  return nil
      #else
      #  puts "All ok.."
      #end

      user_data.gender = user_data.gender[0].upcase   #just save 'F' or 'M' as gender data in file

      puts "Press ENTER to save OR ctrl + c to abort"
      gets.chomp
      self.save_to_file(user_data)

      puts "Press ENTER to add another profile OR ctrl + c to abort"
      gets.chomp
      self.build
      return nill

    end
  end
end
