module Krake
  module Krake::Options
    attr_accessor :token

    def configure
      yield self
    end
  end
end
