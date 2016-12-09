class Url < ActiveRecord::Base

  after_create :shorten
  after_create :strip_url
  validates :long_url, presence: true
  validates :long_url, format: { with: /\.+/} #simple "." validation

  def shorten
    self.short_url = self.id.to_s(36)
  end

  def strip_url
    self.long_url.to_s.sub!(/https?(\:)?(\/)?(\/)?(www\.)?/, '') if self.long_url.include?("http")
    self.long_url.to_s.sub!(/(www\.)?/,'') if self.long_url.include?("www")
    self.save
  end

end
