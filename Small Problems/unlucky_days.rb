# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# Problem: return the number of friday the 13ths in the year given by an argument

# Input: a year as an integer
# Output: an integer, the number of friday the 13ths in that year

# Algorithm:

# => init a counter

# Use Time class to create a time object for the given year on the 13th
# => Time.new(year, 1, 13)
# =>  - check if it is a friday?
# =>   - add to counter if it is
# => Iterate this process, 1..upto 12

def friday_13th(year)
  spookies = 0
  1.upto(12) do |month|
    spookies += 1 if Time.new(year, month, 13).friday?
  end
  spookies
end

# Examples:

p friday_13th(2015) #== 3
p friday_13th(1986) #== 1
p friday_13th(2019) #== 2