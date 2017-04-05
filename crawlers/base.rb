require 'rubygems'
require 'nokogiri'

module RandomPhotos
  class BaseCrawler
    def initialize(path, at_css)
      @path = path
      @at_css = at_css
    end

    def extract
      photos = []
      return photos if (@path.nil? || @at_css.nil?)
      doc = get_doc(@path)
      doc.css(@at_css).each do |item|
        img = item.at_css('img')
        photos << img['src']
      end
      photos
    end

    private

    def get_doc(path)
      user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
      Nokogiri::HTML.parse(open(path, {'User-Agent' => user_agent}))
    end
  end
end
