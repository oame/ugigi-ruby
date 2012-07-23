# coding: utf-8

module Ugigi
  class Parser
    def initialize
      @agent = Mechanize.new
      @agent.user_agent = "Ugigi Ruby #{Ugigi::VERSION}"
    end

    def fetch(args)
      case args[:only]
      when :sosowa
        args = args.update(:sswp => 0, :compe => 0)
      when :compe
        args = args.update(:sswl => 0, :sswp => 0)
      when :sswp
        args = args.update(:sswl => 0, :compe => 0)
      end
      args.delete(:only) if args.has_key? :only
      params = Ugigi.serialize_parameter(args)
      page = @agent.get(URI.join(BASE_URL, params))
      data = JSON.parse(page.body)
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
    
    def total_count(args)
      params = Ugigi.serialize_parameter(args)
      page = @agent.get(URI.join(BASE_URL_NOAPI, params))
      return page.search(%{div[@class="info"]}).children[0].text.strip.split("/")[1].to_i
    end
  end
end