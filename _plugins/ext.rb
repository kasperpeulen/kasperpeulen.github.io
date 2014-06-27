module ImageEncodeCache
  @@cached_base64_codes = Hash.new
  
  def cached_base64_codes
    @@cached_base64_codes
  end
  
  def cached_base64_codes= val
    @@cached_base64_codes = val
  end
end

module Jekyll
  module Tags
    class ImageEncodeTag < Liquid::Tag
      include ImageEncodeCache
          
      def initialize(tag_name, url, options)
        @url = url.strip
        super
      end

      def render(context)
        encode_image
      end
      
      def encode_image
        require 'open-uri'
        require 'base64'
		Base64.strict_encode64(File.binread("ggb/template4.ggb"))
      end
    end
  end
end

Liquid::Template.register_tag('base64', Jekyll::Tags::ImageEncodeTag)
