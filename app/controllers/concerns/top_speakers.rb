module TopSpeakers

  extend ActiveSupport::Concern

  require 'nokogiri'
  require 'open-uri'
  require 'pp'

  def open_xml
    puts 'open_xml'
    @mac_file = open(@mac_url)
    @mac_html = @mac_file.read
    @mac_xml = Nokogiri::XML.parse(@mac_html) do |config|
      config.noblanks
    end
  end

  def make_speaker_hash
    puts 'make_speaker_hash'
    @speaker_line_count = Hash.new
    @mac_xml.css('SPEECH').each do |speech|
      @speaker_and_lines = speech.children
      speaker = @speaker_and_lines.first
      speaker_name = speaker.text
      # puts speaker_name
      # puts "in dict?: #{@speaker_line_count.key?(speaker_name)}"
      unless @speaker_line_count.key?(speaker_name)
        @speaker_line_count[speaker_name] = 0
        # puts "not in dict: #{@speaker_line_count[speaker_name]}"
      end
      # puts "in dict line count: #{@speaker_line_count[speaker_name]}"
      line_count = speech.xpath('./LINE').count
      # puts "adding line count: #{line_count}"
      @speaker_line_count[speaker_name] += line_count
      # puts "new line count: #{@speaker_line_count[speaker_name]}"
    end
    @speaker_line_count = @speaker_line_count.sort_by {|_key, value| value}.reverse
  end

  def parse_xml(mac_url)
    puts 'parse_xml'
    @mac_url = mac_url
    open_xml
    make_speaker_hash
  end

  def speaker_line_count
    return @speaker_line_count
  end

end