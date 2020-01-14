# Beer Song
# Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.


# Write a program to generate the lyrics of the 99 bottles of beer song.
# Verse 99:
# => "99 bottles of beer on the wall, 99 bottles of beer."
# => "Take one down and pass it around, 98 bottles of beer on the wall."

#Verse 2: 
# => "2 bottles of beer on the wall, 2 bottles of beer."
# => "Take one down and pass it around, 1 bottle of beer on the wall."

#Verse 1: 
# => "1 bottle of beer on the wall, 1 bottle of beer."
# => "Take one down and pass it around, no more bottles of beer on the wall."

#Verse 0: 
# => "No more bottles of beer on the wall, no more bottles of beer."
# => "Go to the store and buy some more, 99 bottles of beer on the wall."

# Problem: 
# => iterate through the verses from 99 down to 0, returning (outputting?) each verse
# => verses 99..3 are all the same except for the number of bottles decreasing by 1 each time
# => verse 2 has to lose the "s" plural when it becomes 1 bottle
# => verse 1 has to lose the "s" plural, and also finally say "no more bottles"
# => verse 0 is very different, has fully different second half of verse

# Approach:
# => Create a string with interpolation for the verses with different numbers of beer bottles
# => Create a unique string for verses 0-2

class BeerSong
  attr_accessor :num

  def verse_pt_1
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n"
  end

  def verse_pt_2
    "Take one down and pass it around, #{num} bottles of beer on the wall.\n"
  end

  def last_verse
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verse(verse_num)
    self.num = verse_num
    return last_verse if num == 0      
    
    pt_1 = verse_pt_1
    pt_1.gsub! /bottles/, 'bottle' if num == 1
      
    self.num -= 1 if num > 0
    
    pt_2 = verse_pt_2
    if num == 1
      pt_2.gsub! /bottles/, 'bottle'
    elsif num == 0
      pt_2.gsub! /0/, 'no more'
      pt_2.gsub! /one/, 'it'
    end

    pt_1 + pt_2
  end

  def verses(first, last)
    first.downto(last).map { |verse_num| verse(verse_num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

puts BeerSong.new.verse(1)
    