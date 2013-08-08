require 'uri'
# require 'net/http'

class Url < ActiveRecord::Base
  validate :long_url, presence: true
  # validate :validates_url, on: :create
  validate :short_url, presence: true

  def self.add_url_to_database(long_url)
    letters = ('a'..'z').to_a
    short_url = (rand(9).to_s) + (letters.sample) + (rand(9).to_s) + (letters.sample) + (rand(9).to_s) + (letters.sample)
    Url.create(long_url: long_url, short_url: short_url, counter: 0)
  end

  # def self.prepend_http_if_missing(long_url)
  #   if long_url =~ /^http:\/\//
  #     long_url
  #   else
  #     "http://" + long_url
  #   end
  # end

  # def validates_url
  #   p uri = URI(long_url)
  #   p Net::HTTP.get_response(uri)
  #   p '********'
  #   p Net::HTTP.get_response(uri).message
  #   if (Net::HTTP.get_response(uri).message != 'OK' rescue true)
  #     errors.add(:long_url, "not a valid url")
  #   end
  # end

end
