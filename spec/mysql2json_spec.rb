require 'mysql2json'

describe Mysql2json::Data do
  it "gets and saves data" do
    data = Mysql2json::Data.get("localhost", "yan", "root")
  end
end