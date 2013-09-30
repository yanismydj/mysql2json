require "mysql2json/version"
require "mysql2"
require "json"
require "ruby-progressbar"

module Mysql2json
  class Data
    def self.get(hostname, database_name, username, password = nil)
      client = Mysql2::Client.new(
        host:     hostname,
        username: username,
        database: database_name,
        password: password
      )

      num_tables = 0
      results = client.query("SHOW TABLES").each { |table_data| num_tables += 1 }

      progressbar = ProgressBar.create(title: "Exporting Data", starting_at: 0, total: num_tables)

      tables = {}
      results = client.query("SHOW TABLES").each do |table_data|
        table_name = table_data["Tables_in_#{database_name}"]
        tables[table_name] = []
        client.query("SELECT * FROM #{table_name}").each do |table_row_data|
          tables[table_name] << table_row_data
        end
        progressbar.increment
      end

      tables = tables.to_s.encode('UTF-8', {invalid: :replace, undef: :replace, replace: '?'})
      fileout = File.open("output/#{database_name}.json","wb")
      fileout.write(tables.to_json)
      fileout.close
    end
  end
end
