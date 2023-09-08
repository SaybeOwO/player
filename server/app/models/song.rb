class Song < ApplicationRecord
  # TODO: associazioni con altri modelli (es. User)

  belongs_to :user, foreign_key: :uid

  # validate :link, format: { with: %r{youtu\.be/([^?]*)}, message: 'non è un link YouTube valido' }
  # validate :link, format: { with: %r{^.*((v/)|(embed/)|(watch\?))\??v?=?([^&?]*).*}, message: 'non è un link YouTube valido' }

  #validate :link, presence: true

  validate :link_format
  validate :uid_existing
  before_save :normalize_link
  after_save :check_saving

  def check_saving
    return true if Song.exists?(id: id)

    errors.add(:uid, 'non salvato')
  end

  def uid_existing
    return true if User.exists?(id: uid)

    errors.add(:uid, 'non esiste')
  end

  def link_format
    return true if link =~ %r{youtu\.be/([^?]*)} || link =~ %r{^.*((v/)|(embed/)|(watch\?))\??v?=?([^&?]*).*}

    errors.add(:link, 'non è un link YouTube')
  end

  def normalize_link
    youtube_id = User.youtube_embed(link)
    self.link = "https://www.youtube.com/embed/#{youtube_id}"
  end

  def self.youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    youtube_id
  end
end
