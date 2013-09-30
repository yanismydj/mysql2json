# Mysql2json
This is a simple helper script to convert Mysql to json.  If you've got a lot of data it might explode.  I've used it on tables <500MB with no problems.

## Installation

Add this line to your application's Gemfile:

    gem 'mysql2json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mysql2json

## Usage

```Mysql2json.get_data(hostname, database_name, username, password)```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
