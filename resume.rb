module ResumeBuilder
  class Resume

    include Validation

    def self.build
      
      puts "Press Enter to create user or ctrl + z of stop."
      gets.chomp
      resume = self.new
      user = User.new
      user.first_name = resume.get_first_name
      user.last_name = resume.get_last_name
      user.gender = resume.get_gender[0].upcase
      
      begin
        user.phone = resume.get_phone_number
        user.save
        puts "saved"
      rescue => exception
        puts exception
        retry
      end

      puts "Press Enter to Enter another profile OR ctrl + z to stop.."
      gets.chomp
      build

    end

    def get_first_name
      begin
        print "First Name: "
        valid_name?(gets.strip)
      rescue => exception
        puts exception
        retry        
      end
    end

    def get_last_name
      begin
        print "Last Name: "
        valid_name?(gets.strip)
      rescue => exception
        puts exception
        retry        
      end
    end

    def get_age
      begin
        print "Age: "
        valid_age?(gets.strip)
      rescue => exception
        puts exception
        retry        
      end
    end

    def get_gender
      begin
        print "Gender: "
        valid_gender?(gets.strip)
      rescue => exception
        puts exception
        retry        
      end
    end
    
    def get_phone_number
      begin
        print "10 Digit Phone No.: "
        valid_phone_number?(gets.strip)
      rescue => exception
        puts exception
        retry        
      end
    end

  end
end
