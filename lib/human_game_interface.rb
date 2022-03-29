class HumanGameInterface
  def get_input
    gets.chomp
  end

  def prompt_invalid_input(lower_int, upper_int)
    puts "Please enter a valid selection between #{lower_int} and #{upper_int}"
  end

  def prompt_invalid_space(invalid_user_input)
    puts "#{invalid_user_input} is already played. \nPlease enter a valid move"
  end
end
