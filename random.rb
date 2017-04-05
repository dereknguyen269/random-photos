require_relative 'dependencies'

class Random
  def run
    page = rand PAGE_NUMBER
    site = AT_CSS[SITES.sample]
    url = "#{site[:url]}#{page}"
    work = working_url? (url)
    return run unless work
    RandomPhotos::Crawler.new(url, site[:selector]).call
  end
end

random_photo = Random.new.run
Launchy.open(random_photo)
