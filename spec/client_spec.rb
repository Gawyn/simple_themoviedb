RSpec.describe SimpleTheMovieDB::Client do
  subject { SimpleTheMovieDB::Client.new('foo') }

  before do
    @response = {}
    @parameters =  {
        headers: {'accept' => 'applcation/json'},
        format: :json
    }
  end

  describe ".initialize" do
    it "initialized an object" do
      expect(subject).to be_a SimpleTheMovieDB::Client
    end
  end

  describe "#get_configuration" do
    it 'sends a request through HTTParty' do
      expect(HTTParty).to receive(:get).
        with(SimpleTheMovieDB::Client::BASE_URL + '/configuration?api_key=foo', @parameters).
        and_return(@response)

      expect(@response).to receive(:parsed_response)

      subject.get_configuration
    end
  end

  describe "#get_movie" do
    it 'sends a request through HTTParty' do
      expect(HTTParty).to receive(:get).
        with(SimpleTheMovieDB::Client::BASE_URL + '/movie/1?api_key=foo&language=es', @parameters).
        and_return(@response)

      expect(@response).to receive(:parsed_response)

      subject.get_movie(1, 'es')
    end
  end

  describe "#get_images" do
    it 'sends a request through HTTParty' do
      expect(HTTParty).to receive(:get).
        with(SimpleTheMovieDB::Client::BASE_URL + '/movie/1/images?api_key=foo', @parameters).
        and_return(@response)

      expect(@response).to receive(:parsed_response)

      subject.get_images(1)
    end
  end

  describe "#get_cast" do
    it 'sends a request through HTTParty' do
      expect(HTTParty).to receive(:get).
        with(SimpleTheMovieDB::Client::BASE_URL + '/movie/1/casts?api_key=foo', @parameters).
        and_return(@response)

      expect(@response).to receive(:parsed_response)

      subject.get_cast(1)
    end
  end

  describe "#get_person" do
    it 'sends a request through HTTParty' do
      expect(HTTParty).to receive(:get).
        with(SimpleTheMovieDB::Client::BASE_URL + '/person/1?api_key=foo', @parameters).
        and_return(@response)

      expect(@response).to receive(:parsed_response)

      subject.get_person(1)
    end
  end

  describe "#get_person_images" do
    it 'sends a request through HTTParty' do
      expect(HTTParty).to receive(:get).
        with(SimpleTheMovieDB::Client::BASE_URL + '/person/1/images?api_key=foo', @parameters).
        and_return(@response)

      expect(@response).to receive(:parsed_response)

      subject.get_person_images(1)
    end
  end

  describe "#get_person_credits" do
    it 'sends a request through HTTParty' do
      expect(HTTParty).to receive(:get).
        with(SimpleTheMovieDB::Client::BASE_URL + '/person/1/credits?api_key=foo', @parameters).
        and_return(@response)

      expect(@response).to receive(:parsed_response)

      subject.get_person_credits(1)
    end
  end
end
