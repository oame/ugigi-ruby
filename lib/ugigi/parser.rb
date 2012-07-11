# coding: utf-8

module Ugigi
  class Parser
    def initialize
      @agent = Mechanize.new
      @agent.user_agent = "Ugigi Ruby #{Ugigi::VERSION}"
    end

    def fetch(args)
      params = Ugigi.serialize_parameter(args)
      page = @agent.get(URI.join(BASE_URL, params))
      data = JSON.parse(page.body)
      indexes = []
      data.each do |e|
        index = Index.new(e)
        indexes << index
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