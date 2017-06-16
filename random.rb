require_relative 'dependencies'

class Random
  def initialize
    puts ColorizedString["Starting random photo \u{1f600} \u{1f600}  ..."].colorize(:color => :light_red, :background => :black)
    puts ColorizedString["Please wait a little \u{1f609}  ..."].colorize(:color => :light_blue, :background => :black)
  end

  def run
    page = rand PAGE_NUMBER
    site = AT_CSS[SITES.sample]
    url = "#{site[:url]}#{page}"
    exists = working_url? (url)
    return run unless exists
    RandomPhotos::Crawler.new(url, site[:selector]).call
  end
end

random_photo = Random.new.run
puts ColorizedString["Great Job \u{1f618}  .You can visit this url:"].colorize(:color => :green, :background => :black)
puts ColorizedString["#{random_photo}"].colorize(:color => :light_red, :background => :black)
Launchy.open(random_photo)
