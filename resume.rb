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
      user = User.new
      user.first_name = user.get_first_name
      user.last_name = user.get_last_name
      user.gender = user.get_gender
      user.age = user.get_age
      user.phone = user.get_phone


      #if !user_data.valid_user?
      #  puts "ERROR: Please follow above instruction.."
      #  self.build
      #  return nil
      #else
      #  puts "All ok.."
      #end

      user.gender = user.gender[0].upcase   #just save 'F' or 'M' as gender data in file

      puts "Press ENTER to save OR ctrl + Z to abort"
      gets.chomp
      self.save_to_file(user)

      puts "Press ENTER to add another profile OR ctrl + Z to abort"
      gets.chomp
      self.build
      return nill

    end
  end
end
