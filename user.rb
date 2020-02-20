module ResumeBuilder
  class User
    include Validation
    attr_accessor :first_name, :last_name, :gender, :age, :phone

    def all_data
      user_data = Array.new
      user_data << @first_name << @last_name << @gender << @age << @phone
    end

    def save
      raise "\nError: User with same phone Number already exist\n" if !unique_user_mobile_num?
      f = CSV.open("user_data.csv", "a+")
      f << self.all_data
    end

    private

    def unique_user_mobile_num?
      true if !all_existing_phone.include? @phone
    end

    def all_existing_phone
      begin
        phone_numbers = Array.new
        csv_data = CSV.read("user_data.csv")
        csv_data.each do |data|
          phone_numbers.push(data[data.length - 1])
        end
        phone_numbers
      rescue => exception
        CSV.open("user_data.csv", "w").close
        retry
      end
    end
  end
end
