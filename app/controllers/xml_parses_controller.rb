include TopSpeakers
class XmlParsesController < ApplicationController
	require 'pp'
	require 'nokogiri'
    require 'open-uri'

	def show
		@xml_parse = XmlParse.find(params[:id])

		parse_xml(@xml_parse.xml_url)
		@speaker_line_count
		pp @speaker_line_count
	end

	def new
	end

	def create
		@xml_parse = XmlParse.new(xml_parse_params)

		@xml_parse.save
		redirect_to @xml_parse
	end

	private
		def xml_parse_params
			params.require(:xml_parse).permit(:xml_url)
		end
end
