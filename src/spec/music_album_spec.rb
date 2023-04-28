require_relative '../items/music_album'

RSpec.describe MusicAlbum do
  before(:all) do
    @music_album = MusicAlbum.new(publish_date: Date.parse('2012/4/8'), on_spotify: false)
  end

  describe '#new' do
    it 'should initialize the music_album class' do
      expect(@music_album).to be_an_instance_of(MusicAlbum)
    end
  end
end
