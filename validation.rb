module ResumeBuilder
  module Validation
    def valid_name?(name)
      raise "\nError: Name is empty..\n" if name.empty?
      raise "\nError: Name has Numbers in it..\n" if name.match? /[0-9]/
      name
    end
  
    def is_int?(num_string)
      true if Integer(num_string) rescue false
    end
  
    def valid_age?(age)
      raise "\nError: Age can't be 0.\n" if age == 0
      raise "\nError: Age should be integer.\n" if !is_int? age
      raise "\nError: user is underage.\n" if age.to_i < 18
      age
    end
  
    def valid_gender?(gender)
      raise "\nError: No gender Inserted.\n" if gender.empty?
      raise "\nError: Invalid Gender input formate.\n" if !["male", "m", "female", "f"].include? gender.downcase
      gender
    end
  
    def valid_phone_number?(number)
      raise "\nError: Phone Number is not integer.\n" if !is_int? number
      raise "\nError: Phone Number is not 10 digit.\n" if number.length != 10
      number
    end
    
  end
end
