require_relative '../test_helper'

describe RandomPhotos::Crawler do
  before do
    path = 'http://xkcn.info/page/1'
    at_css = '.post-photo'
    @random = RandomPhotos::Crawler.new(path, at_css)
  end

  describe "run with real page" do
    it 'results must have one photo' do
      res = @random.call
      res.must_include 'http'
    end
  end
end
