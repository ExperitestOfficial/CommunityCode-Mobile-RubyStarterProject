require 'test/unit'
require 'yaml'

class TestUtils < Test::Unit::TestCase

  def self.get_config
    if @config==nil
      @config = YAML.load_file(File.open('config.yml'))
    end
    @config
  end

  def self.get_url
    url = get_config['cloud']['url']
    URI.join(url, "/wd/hub")
  end

  def self.get_access_key
    get_config['cloud']['accessKey']
  end
end



