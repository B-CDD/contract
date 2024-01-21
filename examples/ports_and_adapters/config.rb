# frozen_string_literal: true

require 'bundler/inline'

$LOAD_PATH.unshift(__dir__)

gemfile do
  source 'https://rubygems.org'

  gem 'sqlite3', '~> 1.7'
  gem 'activerecord', '~> 7.1', '>= 7.1.2', require: 'active_record'
  gem 'bcdd-contract', path: '../../'
end

require 'active_support/all'

require 'db/setup'

::BCDD::Contract.config.interface_enabled = ENV.fetch('BCDD_CONTRACT_ENABLED', 'true') != 'false'

module User
  require 'lib/user/data'
  require 'lib/user/repository'
  require 'lib/user/creation'
end

require 'app/models/user/record'
require 'app/models/user/record/repository'
