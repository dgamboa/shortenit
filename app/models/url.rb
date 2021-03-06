class Url < ActiveRecord::Base
  belongs_to :user

  attr_accessible :long_url, :short_url, :num_views

  validates :long_url, :format => { :with => /http[s]?:\/\//, :on => :create }

  before_save :shorten_url

  def shorten_url
    self.short_url = "#{(('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..2].join}"
  end
end
