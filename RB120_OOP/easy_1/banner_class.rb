class Banner
  def initialize(message)
    @message = message
    @size = message.size + 2
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :size

  def horizontal_rule
    "+#{'-' * self.size}+"
  end

  def empty_line
    "|#{' ' * self.size}|"
  end

  def message_line
    "| #{@message} |"
  end
end


# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+

# banner = Banner.new('')
# puts banner
# # +--+
# # |  |
# # |  |
# # |  |
# # +--+

#Further Exploration


class BannerFixedWidth
  def initialize(message, fixed_banner_width=nil)
    @message = message
    @size = determine_size(fixed_banner_width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :size, :message
  attr_accessor :message_lines
  
  def determine_size(fixed_banner_width)
    fixed_banner_width ? fixed_banner_width : message.size + 2
  end
  
  def horizontal_rule
    "+#{'-' * size}+"
  end

  def empty_line
    "|#{' ' * size}|"
  end

  def message_line
    self.split_message
    message_lines.map do |message|
    "|#{message.center(size)}|"
    end
  end
  
  def split_message
    self.message_lines = []
    
    if message.size > size - 2
      start_index = 0

      loop do
        break if start_index > message.size - 1
        message_lines << message[start_index, size - 2]
        start_index += (size - 2)
      end
    else
      message_lines << message
    end
  end
end

banner = BannerFixedWidth.new('To boldly go where no one has gone before.', 6)
puts banner