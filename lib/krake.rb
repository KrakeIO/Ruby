$:.unshift File.dirname(__FILE__)

require 'json'
require 'rest_client'

require 'krake/options'
require 'krake/task'
require 'krake/user'
require 'krake/version'

module Krake
  class << self
    include Krake::Options

    def request(method, resource, headers={}, data={})
      RestClient::Request.execute({
        method:  method,
        url:     "https://api.krake.io/#{resource}",
        headers: headers,
        payload: data.merge({ auth_token: Krake.token })
      })
    end

    def post(resource, headers={}, data={})
      request "POST", resource, headers, data
    end
  end
end

