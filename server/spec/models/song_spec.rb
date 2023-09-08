require 'rails_helper'

RSpec.describe Song, type: :model do
  it 'should exist' do
    expect(defined?(described_class)).to_not be_nil
  end

  describe 'song istance' do
    subject(:song) { described_class.new(link: 'https://www.youtube.com/watch?v=_Y2qfmjCmCw', uid: '1') }

    it { is_expected.to have_attribute(:link) }
    it { is_expected.to have_attribute(:uid ) }

    it 'checks if it is a youtube video ' do
      expect(song.errors[:link_format]).to_not include('non è un link YouTube')
    end

    it 'checks if it is not a youtube video ' do
      song.link = 'decisamentenonunlink'
      expect(song).to_not be_valid
    end

    it 'should validate presence of link' do
      song.link = nil
      expect(song).to_not be_valid
    end

    it 'uid not existing' do
      song.uid = 12345678908236123587162351876351
      expect(song).not_to be_valid
    end

    it 'uid existing' do
      expect(song.errors[:uid_existing]).to_not include('non esiste')
    end

    it 'not saving song' do
      Song.create(link: 'decisamentenonunlink', uid: song.uid)
      expect(song.save).to be false
    end

    it 'saving song' do
      Song.create(link: song.link, uid: song.uid)
      expect(song.errors[:check_saving]).to_not include('non salvato')
    end
  end
  
end