require "mysql2json/version"
require "mysql2"
require "ruby-progressbar"

module Mysql2json
  class Data
    def self.get(hostname, database_name, username, port = 3306, password = nil)
      client = Mysql2::Client.new(
        host:     hostname,
        username: username,
        database: database_name,
        password: password,
        port: port
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

      tables
    end
  end
end
