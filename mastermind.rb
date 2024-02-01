arr = [1,2,3,4,5,6]          # To generate the code maker random 4 digits
code_maker = []
for i in 1..4 do
  code_maker.push(arr.sample)
end

code_breaker=[]         
def code_breaker_process(code_breaker)              # To enter user input
  i = 1
  while i <=4
    p "Enter the input"
    input = gets.chomp.to_i
    if input <=0 
      p "Please enter a valid input"
    elsif input>=7
      p "Please enter a valid input"
    else
      code_breaker.push(input)
      i=i+1
    end
  end
  return code_breaker
end

def no_of_elements(a,b)                         # to find the no of same elements
  arr = []
  sum = 0
  a.each do |ele|
    b.each do |item|
      unless arr.include?(item)
        if ele == item
          sum = sum +1;
          arr.push(item)
          break
        end
      end
    end
  end
  return sum
end

def no_of_elements_in_correct_position(a,b)             # to find the no of same elements in the same position
  temp =0
  a.each_with_index do |element,indexA|
    b.each_with_index do |ele,indexB|
      if element == ele
        if indexA == indexB
          temp = temp+1
        end
      end
    end
  end
  return temp
end

flag =1
while flag >0 do                                            # a loop to check how many times the game must be played and to check whether the winner has been found
if code_maker == code_breaker_process(code_breaker)
  p "Match found"
  flag=0
elsif flag ==3 
  p "no of same elements: #{no_of_elements(code_maker,code_breaker)}"
  p "in same position: #
  {no_of_elements_in_correct_position(code_maker,code_breaker)}"
  p "match not found, you lose"
  flag =0
else
  p "no of same elements: #{no_of_elements(code_maker,code_breaker)}"
  p "In same position: #{no_of_elements_in_correct_position(code_maker,code_breaker)}"
  p "Match not found, Please try again"
  flag=flag+1
  code_breaker=[]
end
end











