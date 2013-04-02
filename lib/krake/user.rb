module Krake
  class User
    class << self
      def valid?
        request = Krake.post("validate-authtoken")
        JSON.parse(request)["status"].eql?("success")
      end

      def tasks
        request = Krake.post("show-scrapes")
        JSON.parse(request)["scrapes"]
      end
    end
  end
end
