require_relative 'base'

module RandomPhotos
  class Crawler < BaseCrawler
    def call
      arr = extract
      random_photo = arr.size.zero? ? 'http://68.media.tumblr.com/6707567f4007a0ebb6e342f37692da0b/tumblr_of8kzf8gMp1qbd81ro1_500.jpg' : arr.sample
      random_photo
    end
  end
end
