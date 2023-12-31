require 'net/http'
require 'uri'

class LineNotify
  TOKEN = 'bERR0aJZMIJKrzNA1dqe9XTLJPbD7CGBhpGVVfckHYx'.freeze
  URL = 'https://notify-api.line.me/api/notify'.freeze

  attr_reader :message

  def self.send(message)
    new(message).send
  end

  def initialize(message)
    @message = message
  end

  def send
    Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |https|
      https.request(request)
    end
  end

  private

  def request
    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Bearer #{TOKEN}"
    request.set_form_data(message: message)
    request
  end

  def uri
    URI.parse(URL)
  end
end
