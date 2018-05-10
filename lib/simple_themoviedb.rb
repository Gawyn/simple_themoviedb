require 'simple_themoviedb/version'
require 'httparty'

module SimpleTheMovieDB
  class Client
    attr_reader :api_key

    BASE_URL = 'http://api.themoviedb.org/3'.freeze

    def initialize(api_key)
      @api_key = api_key
    end

    def search(title, adult = nil)
      url = '/search/movie?'
      options = { query: title, api_key: @api_key }
      options = options.merge(include_adult: adult) if adult

      response = get_and_parse(url, options)
      total_pages = response['total_pages']

      return unless total_pages && total_pages.is_a?(Integer)

      (2..total_pages).inject(response['results']) do |res, page|
        options[:page] = page
        page_results = get_and_parse(url, options) || []
        res + page_results
      end
    end

    def get_configuration
      url = '/configuration?'
      get_and_parse(url)
    end

    def get_movie(id, lang = nil)
      url = "/movie/#{id}?"
      options = { api_key: @api_key }
      options = options.merge(language: lang) if lang
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
      response = HTTParty.get(
        BASE_URL + url + to_query(options),
        headers: { 'accept' => 'applcation/json' },
        format: :json
      )

      response.parsed_response
    end

    def to_query(options)
      options.map do |key, value|
        "#{key}=#{value}"
      end.join('&')
    end
  end
end
