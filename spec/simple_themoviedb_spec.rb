RSpec.describe SimpleTheMovieDB do
  it "has a version number" do
    expect(SimpleTheMovieDB::VERSION).not_to be nil
  end

  it "is instantiable" do
    expect(SimpleTheMovieDB::Client.new('foo')).to be_a SimpleTheMovieDB::Client
  end
end
