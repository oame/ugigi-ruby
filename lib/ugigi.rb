# coding: utf-8

require "kconv"
require "net/http"
require "time"
require "json"
require "uri"

$LOAD_PATH.unshift(File.expand_path("../", __FILE__))
require "ugigi/version"
require "ugigi/scheme"

module Ugigi
  BASE_URL = "http://ugigi.dvrdns.org/api/"
  
  protected
  
  def self.serialize_parameter(parameter={})
    return "" unless parameter.class == Hash
    ant = Hash.new
    parameter.each do |key, value|
      ant[key.to_sym] = value.to_s
    end
    param = ant.inject(""){|k,v|k+"&#{v[0]}=#{URI.escape(v[1])}"}.sub!(/^&/,"?")
    return param ? param : ""
  end

  def self.send_req(path, params={})
    uri = URI.join(BASE_URL, path, serialize_parameter(params))
    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)
  end
  
  public

  def self.search(args={})
    case args[:only]
    when :sosowa
      args = args.update(:sswp => 0, :compe => 0)
    when :compe
      args = args.update(:sswl => 0, :sswp => 0)
    when :sswp
      args = args.update(:sswl => 0, :compe => 0)
    end
    args.delete(:only) if args.has_key? :only
    data = send_req("search/list.json", args)
    indexes = []
    data.each do |e|
      index = Index.new(e)
      case args[:style]
      when :sosowa
        index.element = index.to_sosowa_index
        indexes << index
      else
        indexes << index
      end
    end
    return indexes
  end

  def self.total_count(args={})
    data = send_req("search/list_count.json", args)
    return data["count"]
  end

  def self.mylist(args={})
    data = send_req("list/get", args)
    indexes = []
    data.each do |e|
      index = Index.new(e)
      case args[:style]
      when :sosowa
        index.element = index.to_sosowa_index
        indexes << index
      else
        indexes << index
      end
    end
    return indexes
  end

  def self.mylist_add(args={})
    data = send_req("list/add", args)
    return data
  end

  def seld.mylist_remove(args={})
    data = send_req("list/rem", args)
    return data
  end

  def seld.mylist_edit(args={})
    data = send_req("list/edit", args)
    return data
  end
end
