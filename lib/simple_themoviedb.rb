require "simple_themoviedb/version"
require "httparty"

module SimpleTheMovieDB
  class Client
    attr_reader :base, :api_key

    include HTTParty
    base_uri "http://api.themoviedb.org/3"
    headers 'accept' => 'application/json' 
    format :json

    def initialize(api_key)
      @api_key = api_key
    end

    def search(title, adult = nil)
      url = "/search/movie?"
      options = { :query => title, :api_key => @api_key }
      options = options.merge( :include_adult => adult ) if adult

      response = self.class.get(url + options.to_query)
      parsed_response = response.parsed_response
      total_pages = parsed_response["total_pages"]

      if total_pages && total_pages.is_a?(Integer)
        (2..total_pages).inject(parsed_response["results"]) do |res, page|
          options[:page] = page
          page_results = self.class.get(url + options.to_query).parsed_response["results"] || []
          res + page_results
        end
      end
    end

    def get_configuration
      url = "/configuration?"
      get_and_parse(url)
    end

    def get_movie(id, lang = nil)
      url = "/movie/#{id}?"
      options = { :api_key => @api_key }
      options = options.merge(:language => lang) if lang
      get_and_parse(url, options)
    end

    def get_images(id)
      url = "/movie/#{id}/images?"
      get_and_parse(url)
    end

    def get_cast(id)
      url = "/movie/#{id}/casts?"
      get_and_parse(url)
    end

    def get_person(id)
      url = "/person/#{id}?"
      get_and_parse(url)
    end

    def get_person_images(id)
      url = "/person/#{id}/images?"
      get_and_parse(url)
    end

    def get_person_credits(id)
      url = "/person/#{id}/credits?"
      get_and_parse(url)
    end

    private

    def get_and_parse(url, options = { api_key: @api_key })
      self.class.get(url + to_query(options)).parsed_response
    end

    def to_query(options)
      options.map do |key, value|
        "#{key}=#{value}"
      end.join("&")
    end
  end
end
