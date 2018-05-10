# SimpleTheMovieDB

A brutally simple wrapper on the themoviedb.com API. The library that powers [Love4Movies](http://love4movies.com).

## Installation

```ruby
gem 'simple_themoviedb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_themoviedb

## Usage

First of all, initialize a client:

```ruby
require 'simple_themoviedb'
@client = SimpleTheMovieDB::Client.new('your-api-key')
```

The SimpleTheMovieDB::Client has a few methods at your disposal:

- #search

Accepts one string (the query) as parameter. Returns an Array of Hashes. Each Hash contains a summarized version of the movie data.

```ruby
@client.search('The Wolf of Wall Street')
 => [{"vote_count"=>8895, "id"=>106646, "video"=>false, "vote_average"=>7.9, "title"=>"The Wolf of Wall Street", "popularity"=>36.903397, "poster_path"=>"/vK1o5rZGqxyovfIhZyMELhk03wO.jpg", "original_language"=>"en", "original_title"=>"The Wolf of Wall Street", "genre_ids"=>[80, 18, 35], "backdrop_path"=>"/rP36Rx5RQh0rmH2ynEIaG8DxbV2.jpg", "adult"=>false, "overview"=>"A New York stockbroker refuses to cooperate in a large securities fraud case involving corruption on Wall Street, corporate banking world and mob infiltration. Based on Jordan Belfort's autobiography.", "release_date"=>"2013-12-25"}, {"vote_count"=>0, "id"=>423766, "video"=>false, "vote_average"=>0, "title"=>"The Wolf of Wall Street", "popularity"=>1.00119, "poster_path"=>"/aNGsE1nVtQHu4pvPzNvqVaczztb.jpg", "original_language"=>"en", "original_title"=>"The Wolf of Wall Street", "genre_ids"=>[], "backdrop_path"=>nil, "adult"=>false, "overview"=>"A ruthless stockbroker sells short in the copper business and ruins the life of his friends by ruining their finances.", "release_date"=>"1929-02-09"}] 
```

- #get_movie

Accepts one integer (the ID) as parameter. Returns the full data for the given movie.

```ruby
@client.get_movie(106646)
 => {"adult"=>false, "backdrop_path"=>"/rP36Rx5RQh0rmH2ynEIaG8DxbV2.jpg", "belongs_to_collection"=>nil, "budget"=>100000000, "genres"=>[{"id"=>80, "name"=>"Crime"}, {"id"=>18, "name"=>"Drama"}, {"id"=>35, "name"=>"Comedy"}], "homepage"=>"http://www.thewolfofwallstreet.com/", "id"=>106646, "imdb_id"=>"tt0993846", "original_language"=>"en", "original_title"=>"The Wolf of Wall Street", "overview"=>"A New York stockbroker refuses to cooperate in a large securities fraud case involving corruption on Wall Street, corporate banking world and mob infiltration. Based on Jordan Belfort's autobiography.", "popularity"=>35.903397, "poster_path"=>"/vK1o5rZGqxyovfIhZyMELhk03wO.jpg", "production_companies"=>[{"id"=>14654, "logo_path"=>nil, "name"=>"EMJAG Productions", "origin_country"=>""}, {"id"=>4, "logo_path"=>"/fycMZt242LVjagMByZOLUGbCvv3.png", "name"=>"Paramount", "origin_country"=>"US"}, {"id"=>19177, "logo_path"=>nil, "name"=>"Red Granite Pictures", "origin_country"=>""}, {"id"=>562, "logo_path"=>"/k3NsSdV854UX4zEReX1dl1Psxbb.png", "name"=>"Appian Way", "origin_country"=>"US"}, {"id"=>23243, "logo_path"=>nil, "name"=>"Sikelia Productions", "origin_country"=>""}], "production_countries"=>[{"iso_3166_1"=>"US", "name"=>"United States of America"}], "release_date"=>"2013-12-25", "revenue"=>392000694, "runtime"=>180, "spoken_languages"=>[{"iso_639_1"=>"fr", "name"=>"Français"}, {"iso_639_1"=>"en", "name"=>"English"}], "status"=>"Released", "tagline"=>"EARN. SPEND. PARTY.", "title"=>"The Wolf of Wall Street", "video"=>false, "vote_average"=>7.9, "vote_count"=>8898} 
2.5.1 :031 
```

- #get_images

Accepts one integer (the movie ID) as parameter. Returns an Array of Hashes with information on the images The MovieDatabase has of that particular movie.

- #get_cast

Accepts one integer (the movie ID) as parameter. Returns a Hash with three keys: id, cast and crew. ID is self-explanatory. Cast and crew are array of hashes with information on each member of the cast and the crew of the movie

- #get_person

Accepts one integer (the person ID) as parameter. Returns the full data for the given person.

- #get_person_images

Accepts one integer (the person ID) as parameter. Returns an Array of Hashes with information on the images The MovieDatabase has of that particular person.

- #get_person_credits

Accepts one integer (the person ID) as parameter. Returns a Hash with three keys: id, cast and crew. ID is self-explanatory. Cast and crew are array of hashes with information on the roles taken by this particular person in all of his movies, as an actor or as a crew-member.

- #get_configuration

Accepts no parameters. Returns information about the parameters accepted by The Movie Database.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/simple_themoviedb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
