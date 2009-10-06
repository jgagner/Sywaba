RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION


require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'

  config.gem 'mislav-will_paginate', :lib => 'will_paginate',
             :version => '~> 2.3.11', :source => 'http://gems.github.com'
  
  config.gem 'jackdempsey-acts_as_commentable',
             :lib => 'acts_as_commentable',
             :source => "http://gems.github.com",
             :version=>'2.0.2'
end