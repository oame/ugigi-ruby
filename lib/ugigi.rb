require "kconv"
require "mechanize"
require "time"
require "json"
require "uri"

$LOAD_PATH.unshift(File.expand_path("../", __FILE__))
require "ugigi/version"
require "ugigi/scheme"
require "ugigi/parser"

module Ugigi
  BASE_URL = "http://ugigi.dvrdns.org/api/search/list.json"
  BASE_URL_NOAPI = "http://ugigi.dvrdns.org/search"
  
  protected
  
  def self.serialize_parameter parameter
    return "" unless parameter.class == Hash
    ant = Hash.new
    parameter.each do |key, value|
      ant[key.to_sym] = value.to_s
    end
    param = ant.inject(""){|k,v|k+"&#{v[0]}=#{URI.escape(v[1])}"}.sub!(/^&/,"?")
    return param ? param : ""
  end
  
  public
  
  def self.search(args={})
    parser = Parser.new
    parser.fetch(args)
  end
  
  def self.total_count(args)
    parser = Parser.new
    parser.total_count(args)
  end
end
