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
  end
end