# gems

  gem env

  how to set path
    echo $PATH
    export PATH="/path/to/my/executables-directory:$PATH"

  check gem version
    during pry:
      puts $LOADED_FEATURES.grep(/freewill\.rb/)

      That command searches for any entries in the $LOADED_FEATURES Array that include freewill.rb

  ways besides a bundler to get another gem:

    Provide an absolute path name to require.
    Add an appropriate -I option to the Ruby invocation.
    Modify $LOAD_PATH prior to requiring somegem.
    Modify the RUBYLIB environment variable.

# bundler

  bundler relies on gemfiles like:

  ```ruby
  source 'https://rubygems.org'

  ruby '2.3.1'
  gem 'sinatra'
  gem 'erubis'
  gem 'rack'
  gem 'rake', '~>10.4.0'
  ```

  After you create Gemfile, the bundle install command scans it, downloads and installs all the dependencies listed, and produces a Gemfile.lock file. Gemfile.lock

  bundle install
    installs specified gems and create Gemfile.lock

  after gemfile include:
    require 'bundler/setup'

  Unfortunately, you will surely encounter situations where you can't just add require 'bundler/setup' to the code, or the program itself may run code that has conflicting needs. When this happens, you need the often mysterious bundle exec command.

  You can use bundle exec to run most any command in an environment that conforms to the Gemfile.lock versioning info. In fact, we can use this feature to see how bundle exec modifies your environment:

  diff <(bundle exec env) <(env)

  $ bundle exec rake
    changes current version of rake

  # Any Gem command that requires other Gems may load a Gem that conflicts with your app's requirements. bundle exec is the easiest way to fix this issue. #

  IF YOU HAVE OTHER ISSUES:

  Here are some more things to try if problems continue:

  Remove your Gemfile.lock and run bundle install again. This creates a new Gemfile.lock file.

  Remove the .bundle directory and its contents from your project directory and run bundle install again.

  If you're using the binstubs feature, remove the directory used by binstubs and run bundle install --binstubs again. Don't do this if you aren't using binstubs.

  Remove and reinstall Bundler:

  If gem list shows that either rubygems-bundler or open_gem are installed, uninstall them. These old Gems are incompatible with Bundler. Repeat the above items if you remove either Gem.

  Issue this command in the command line from your app's top-level directory:
    $ rm Gemfile.lock ; DEBUG_RESOLVER=1 bundle install

    This command removes the Gemfile.lock file, then runs bundle install while producing debug information. 

# Rake

  rake is a gem based on unix 'make'

  it automates a lot of development stuff like:
    - directory setup
    - set up and initialize databases
    - run tests
    - package app for distribution
    - install app
    - perform git tasks
    - rebuild files based on other things

    rake uses a `Rakefile` that lives in the project directory i.e.

    ```ruby
    desc 'Say hello'
    task :hello do
      puts "Hello there. This is the `hello` task."
    end

    desc 'Say goodbye'
    task :bye do
      puts 'Bye now!'
    end

    desc 'Do everything'
    task :default => [:hello, :bye]
    ```

    rake invokes the `default` task unless you specify otherwise
    rake methods `desc` and `task`
      desc gives a short description when you run `rake -T`
      task associates a name with either some block of ruby code or a list of dependencies
      above, default depends on hello and bye

    first, test rake file with `rake -T`

    $ bundle exec rake -T
      rake bye      # Say goodbye
      rake default  # Do everything
      rake hello    # Say hello

    # NOTE bundle exec # - makes sure using the version of rake your app depends on!

