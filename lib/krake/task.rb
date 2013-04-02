module Krake
  class Task
    attr_accessor :description, :origin_url, :destination_url
    attr_accessor :columns, :next_page, :data, :cookies
    attr_accessor :mongodb, :rdbParams

    def initialize
      yield self 
    end

    def to_hash
      { description:     self.description,
        origin_url:      self.origin_url,
        destination_url: self.destination_url,
        columns:         self.columns,
        next_page:       self.next_page,
        data:            self.data,
        cookies:         self.cookies,
        mongodb:         self.mongodb,
        rdbParams:       self.rdbParams
      }
    end

    def submit
      Krake.post("do-scrape", {}, self.to_hash)
    end
  end
end
