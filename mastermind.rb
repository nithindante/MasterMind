puts "Do you want to be the CodeMaker or the CodeBreaker, (1,2)"
input = gets.chomp.to_i
if input == 2
  arr = [1, 2, 3, 4, 5, 6]
  code_maker = []
  for i in 1..4
    code_maker.push(arr.sample)
  end
  p code_maker
  code_breaker = []
  def code_breaker_process(code_breaker)
    i = 1
    while i <= 4
      p "Enter the input"
      input = gets.chomp.to_i
      if input <= 0
        p "Please enter a valid input"
      elsif input >= 7
        p "Please enter a valid input"
      else
        code_breaker.push(input)
        i += 1
      end
    end
    code_breaker
  end

  def no_of_elements(a, b)
    arr = []
    sum = 0
    a.each do |ele|
      b.each do |item|
        next if arr.include?(item)
        next unless ele == item

        sum += 1
        arr.push(item)
        break
      end
    end
    sum
  end

  def no_of_elements_in_correct_position(a, b)
    temp = 0
    a.each_with_index do |element, indexA|
      b.each_with_index do |ele, indexB|
        next unless element == ele

        temp += 1 if indexA == indexB
      end
    end
    temp
  end

  flag = 1
  while flag > 0
    if code_maker == code_breaker_process(code_breaker)
      p "Match found"
      flag = 0
    elsif flag == 8
      p "no of same elements: #{no_of_elements(code_maker, code_breaker)}"
      p "in same position: #{no_of_elements_in_correct_position(code_maker, code_breaker)}"
      p "match not found, you lose"
      flag = 0
    else
      p "no of same elements: #{no_of_elements(code_maker, code_breaker)}"
      p "In same position: #{no_of_elements_in_correct_position(code_maker, code_breaker)}"
      p "Match not found, Please try again"
      flag += 1
      code_breaker = []
    end
  end
elsif input == 1
  def no_of_elements(a, b)
    arr = []
    sum = 0
    a.each do |ele|
      b.each do |item|
        next if arr.include?(item)
        next unless ele == item
        sum += 1
        arr.push(item)
        break
      end
    end
    sum
  end

  def no_of_elements_in_correct_position(a, b)
    temp = 0
    temp_index = []
    a.each_with_index do |element, indexA|
      b.each_with_index do |ele, indexB|
        next unless element == ele
        if indexA == indexB
          temp += 1
          temp_index.push(indexA)
        end
      end
    end
    return temp, temp_index
  end

  p "Enter the input"
  input_array = []
  a = 1
  while a <= 4
    input = gets.chomp.to_i
    if input <= 0
      p "Please enter a valid input"
    elsif input >= 7
      p "Please enter a valid input"
    else
      input_array.push(input)
      a += 1
    end
  end

  p input_array
  def code_maker_process()
    arr = [1, 2, 3, 4, 5, 6]
    code_maker = []
    for i in 1..4
      code_maker.push(arr.sample)
    end
    return code_maker
  end

  formatted_array = []
  def check_process(code_maker_process, input_array, formatted_array)
    new_array = [1, 2, 3, 4, 5, 6]

    if formatted_array.length <= 0
      t = code_maker_process
      p "no of same elements: #{no_of_elements(input_array, t)}"
      temp_var = no_of_elements_in_correct_position(input_array, t)
      p " in same position: #{temp_var[0]}"
      p t
      #p "my outer temp is #{temp_var}"
      if temp_var[1].length > 0
        #p " my random array is #{t}"
        t.each_with_index do |ele, ind|
          if ind == temp_var[1][0]
            formatted_array[ind] = ele
          elsif ind == temp_var[1][1]
            formatted_array[ind] = ele
          else
            formatted_array[ind] = new_array.sample
          end
        end
      end
      #p "my formatted array is here #{formatted_array}"
      p formatted_array.length
    else
      p "no of same elements: #{no_of_elements(input_array, formatted_array)}"
      temp_var =
        no_of_elements_in_correct_position(input_array, formatted_array)
      p " in same position: #{temp_var[0]}"
      p formatted_array
      formatted_array.each_with_index do |ele, ind|
        if ind == temp_var[1][0]
          formatted_array[ind] = ele
        elsif ind == temp_var[1][1]
          formatted_array[ind] = ele
        elsif ind == temp_var[1][2]
          formatted_array[ind] = ele
        elsif ind == temp_var[1][3]
          formatted_array[ind] = ele
        else
          formatted_array[ind] = new_array.sample
        end
      end
      #p "my new formatted array is here #{formatted_array}"
    end
    #p "my formatted array is #{formatted_array}"
  end

  flag = 1
  while flag > 0
    if code_maker_process == input_array
      p t
      p "Match found"
      flag = 0
    elsif formatted_array == input_array
      p formatted_array
      p "Match found"
      flag = 0
    elsif flag == 8
      check_process(code_maker_process, input_array, formatted_array)
      puts "\n"
      p "match not found, you lose"
      flag = 0
    else
      check_process(code_maker_process, input_array, formatted_array)
      puts "\n"
      p "Match not found, Please try again"
      puts "\n"
      flag += 1
    end
  end
end
