class Url < ActiveRecord::Base
  attr_accessible :long_url, :short_url

  validates :long_url, :format => { :with => /http[s]?:\/\//, :on => :create }

  before_save :set_short_url

  private

  def shorten_url
    "http://shortenit/#{(('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..2].join}"
  end

  def set_short_url
    self.short_url = shorten_url
  end
end
