# Banner Class
# Behold this incomplete class for constructing boxed banners.

class Banner
  
  def initialize(message, banner_width)
    @message = message
    @banner_width = banner_width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :banner_width

  def horizontal_rule
    "+" + ("-" * banner_width) + "+"
  end

  def empty_line
    "|" + (" " *  banner_width) + "|"
  end

  def message_line
    "|#{equal_spaces}#{@message}#{equal_spaces}|"
  end

  def equal_spaces
    equal_spaces = (banner_width - message.length) / 2
    " " * (equal_spaces)
  end
end

# Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Test Cases

banner = Banner.new('To boldly go where no one has gone before.', 76)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
banner = Banner.new('', 74)
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
# Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. The message in the banner should be centered within the banner of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.

