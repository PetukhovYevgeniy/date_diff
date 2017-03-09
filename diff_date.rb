class DiffDate

  def initialize
    print 'Enter first value: '
    @first_value = gets
    print 'Enter second value: '
    @second_value = gets

    @result

    @days = 0
    @hours = 0
    @minutes = 0
    @seconds = 0
    parse_date

  end

  def show_res
    puts @result
  end

  #parsing result
  def parse_date
    difference_date

    @days = (@result / (60 * 60 * 24)).to_i
    @hours = (@result / (60 * 60) - @days * 24).to_i
    @minutes = (@result / 60 - @days * 60 * 24 - @hours * 60).to_i
    @seconds = (@result % 60).to_i

    @result = @days.to_s + " day" + (@days != 1 ? "s " : " ")
    @result += @hours.to_s + " hour" + (@hours != 1 ? "s " : " ")
    @result += @minutes.to_s + " minute" + (@minutes != 1 ? "s " : " ")
    @result += @seconds > 0 ? ("and " + @seconds.to_s + " second") + (@seconds > 1 ? "s " : " ") : ""
  end

  #Difference of seconds
  def difference_date
    @first_value = convert_str_to_i(@first_value)
    @second_value = convert_str_to_i(@second_value)

    if  @first_value > @second_value
      @result = @first_value.to_i - @second_value
    elsif @first_value < @second_value
      @result = @second_value - @first_value
    else
          @result = 'no difference'
          print @result
          exit                                  #EXIT if the num is same
    end
    return @result
  end

  #convert to int
  def convert_str_to_i(str)
  temp_str = ''
    for i in 0...str.to_s.length
      for j in 0..9

        if str.to_s.chars[i] == j.to_s
          temp_str += str.to_s.chars[i]
          next
        else
          str.to_s.chars.delete_at(i)
      end
    end
  end
  return temp_str.to_i
  end

end

def main
  test = DiffDate.new

  test.show_res
end

main
