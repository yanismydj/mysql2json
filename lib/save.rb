require "json"

module Mysql2json
  class OutputFile
    def self.save(filename)
      tables = tables.to_s.encode('UTF-8', {invalid: :replace, undef: :replace, replace: '?'})
      fileout = File.open("output/#{filename}.json","wb")
      fileout.write(tables.to_json)
      fileout.close
    end
  end
end