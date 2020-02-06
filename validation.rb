module ResumeBuilder
 module Validation
  def valid_name?(name)
    if name.empty?
      puts "Empty Name."
      return false
    elsif name.match? /[0-9]/
      puts "There is number in the name."
      return false
    elsif name.count(" ") > 1
      puts "To many spaces."
      return false
    else
      return true
    end
  end

  def is_int?(num_string)
    true if Integer(num_string) rescue false
  end

  def valid_age?(age)
    if age == 0
      puts "Age can't be that..."
      return false
    elsif age < 18
      puts "You are underage. Registration not allowed."
      return false
    else
      return true
    end
  end

  def valid_gender?(gender)
    if gender.empty?
      puts "Missing GENDER info.."
      return false
    elsif !["male", "m", "female", "f"].include? gender.downcase
      puts "Invalid GENDER formate"
      return false
    else
      return true
    end
  end

  def valid_phone_number?(number)
    if !is_int? number
      puts "Phone number must be integer"
      return false
    elsif number.length != 10
      puts "Please enter valid 10 digit mobile number."
      return false
    else
      return true
    end
  end
 end
end
