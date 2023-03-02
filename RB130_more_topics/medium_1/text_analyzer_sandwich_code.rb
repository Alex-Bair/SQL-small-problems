TEXT = 'text_analyzer_sandwich_code_text.txt'
TEXT2 = 'text_sample.txt'

class TextAnalyzer
  def process
    file = File.open(TEXT2)
    yield(file.read) if block_given?
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").count} lines" }
analyzer.process { |file| puts "#{file.split(' ').count} words" }

=begin
Output should be:
3 paragraphs
15 lines
126 words
=end