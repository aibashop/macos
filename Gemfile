source "https://rubygems.org"
ruby File.read(".ruby-version").strip

gem "fastlane", "2.226"

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
