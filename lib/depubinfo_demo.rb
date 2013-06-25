require 'epubinfo'
require 'pry'

module Example
  class EpubInfoDemo

    def initialize
    end

    def extract_info(epub_file)
      EPUBInfo.get(epub_file)
    end

    def print_info(info)
      desc = ""
      if info
        desc += "\nPublisher  : #{info.publisher}"            if info.publisher
        desc += "\nSubjects   : #{info.subjects}"             unless info.subjects.empty?
        desc += "\nTitles     : #{info.titles}"               if info.titles
        desc += "\nCreators   : #{info.creators.map(&:name)}" if info.creators
        desc += "\nDescription: #{info.description}"          if info.description
      end
      desc
    end
  end
end

if __FILE__ == $0
  include Example
  demo = EpubInfoDemo.new
  filename = File.dirname(__FILE__) + '/../samples/childrens.epub'
  result = demo.extract_info(filename)
  puts demo.print_info(result) if result
end

# Output:
# Subjects   : ["Children -- Books and reading", "Children's literature -- Study and teaching"]
# Titles     : ["Children's Literature", "A Textbook of Sources for Teachers and Teacher-Training Classes"]
# Creators   : ["Charles Madison Curry", "Erle Elsworth Clippinger"]
