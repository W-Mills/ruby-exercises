# require 'minitest/reporters'
# require 'minitest/autorun'
# require 'minitest/pride'

# Minitest::Reporters.use!

# require_relative 'sample_class'

# class SampleClassTest < Minitest::Test
  
#   def setup
#     @sample_text = File.open('./sample_text.txt', 'r')
    
#   end

#   def teardown
#     @sample_text.close
#   end

#   def test_swap
#     sample_text = Text.new(@sample_text)
#     sample_text.swap('a', 'e')

#     expected_text = <<~TEXT
#     Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum. Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
#     dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres et verius meuris, et pheretre mi.
#     TEXT



#     assert_equal(sample_text, expected_text)
#   end

# end

require 'minitest/autorun'
require_relative 'sample_class'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum. Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text.chomp, actual_text
  end

  def test_word_count
    text = Text.new(@file.read)
    actual_count = text.word_count
    expected_word_count = 72

    assert_equal expected_word_count, actual_count
  end

  def teardown
    @file.close
    puts "#{@file} has been closed? : #{@file.closed?}"
  end
end