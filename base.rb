# Add my most frequently used Gems
gem "thin"

gem_group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "shoulda-matchers"
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "rb-inotify"
end

run "bundle install"
run "bundle exec rails g rspec:install"

# Git rid of the annoying default files
run "rm README.rdoc"
run "rm public/index.html"

# Add some sensible default files
file "app/controllers/public_controller.rb", <<-CODE
class PublicController < ApplicationController

  def index
  end

end
CODE

file "app/views/public/index.html.erb", <<-CODE
<h1>Home</h1>
CODE

app_name = ask("New project name:")
file "README.md", <<-MARKDOWN
# #{app_name}

Application description will go here.
MARKDOWN

# Set up the default route
route "root to: 'public#index'"

# Create the Git repository
git :init
git add: "."
git commit: "-a -m 'We have lift off.'"
