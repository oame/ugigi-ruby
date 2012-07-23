module Ugigi
  class Scheme
    attr_accessor :element
    
    def method_missing(action, *args)
      return @element[action.to_s] rescue nil
    end
    
    public
    
    def params() @element.keys.map{|k|k.to_sym} ; end
    alias_method :available_methods, :params
  end
  
  class Index < Scheme
    def initialize(element)
      @element = element
    end
    
    def to_sosowa_index
      log = link.scan(/log=(\d+?)/)[0][0].to_i
      key = link.scan(/key=(\d+?)/)[0][0].to_i
      pp @element["link"]
      index = {
        :log => log,
        :key => key,
        :title => title,
        :author => author,
        :created_at => posted_at,
        :updated_at => updated_at,
        :review_count => nil,
        :comment_count => comment,
        :point => point,
        :tags => tags,
        :rate => @element["eval"],
        :size => size,
        :url => link
      }
    end
  end
end