def is_leap_year?(year)
  return (((year % 4 == 0) and (year % 100 != 0)) or (year % 400 == 0))
end

def resolve_day(absolute_day)
  return absolute_day % 7
end

days_in_month = {}
days_in_month[0] = 31
days_in_month[1] = 0
days_in_month[2] = 31
days_in_month[3] = 30
days_in_month[4] = 31
days_in_month[5] = 30
days_in_month[6] = 31
days_in_month[7] = 31
days_in_month[8] = 30
days_in_month[9] = 31
days_in_month[10] = 30
days_in_month[11] = 31

first_on_sunday = 0

absolute = 0
year_range = 1900..2000
year_range.each{|y|
  #puts "#{y}"
  if is_leap_year?(y)
    days_in_month[1] = 29
  else
    days_in_month[1] = 28
  end
  
  (0..11).each{|m|
    absolute += days_in_month[m]
    if resolve_day(absolute) == 6 and y > 1900
      first_on_sunday += 1
    end
  }
}

puts "#{first_on_sunday}"
