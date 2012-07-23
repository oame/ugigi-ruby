module Ugigi
  class Scheme
    attr_accessor :element
    
    def method_missing(action, *args)
      return @element[action.to_s] || @element[action.to_sym] rescue nil
    end
    
    def params() @element.keys.map{|k|k.to_sym} ; end
    alias_method :available_methods, :params
  end
  
  class Index < Scheme
    def initialize(element)
      @element = element
    end
    
    def to_sosowa_index
      log = @element["link"].scan(/log=(\d+?)/)[0][0].to_i
      key = @element["link"].scan(/key=(\d+?)/)[0][0].to_i
      index = {
        :log => log,
        :key => key,
        :title => @element["title"],
        :author => @element["author"],
        :created_at => @element["posted_at"],
        :updated_at => @element["updated_at"],
        :review_count => nil,
        :comment_count => @element["comment"],
        :point => @element["point"],
        :tags => @element["tags"],
        :rate => @element["eval"],
        :size => @element["size"],
        :url => @element["link"]
      }
    end
  end
end