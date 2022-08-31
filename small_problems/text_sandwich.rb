require 'pry'

class TextAnalyzer
  def process
   text_file = File.open('sample_text.txt', 'r')
   text = text_file.read
   yield(text) if block_given?
   text_file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split(/\n{2}/).count} paragraphs" }
analyzer.process { |text| puts "#{text.split(/\n/).count} lines" }
analyzer.process { |text| puts "#{text.split(/[ \.]/).count} words"}

# 3 paragraphs
# 15 lines
# 126 words