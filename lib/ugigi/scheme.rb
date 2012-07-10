module Ugigi
  class Scheme
    protected
    
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
  end
end