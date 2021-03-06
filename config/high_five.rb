HighFive::Config.configure do |config|
  config.root = File.join(File.dirname(__FILE__), '..')
  config.destination = "www"

  # Uncomment this if you're on windows and having problems with a strange ExecJS RuntimeError
  # config.windows!

  # This will add the resources folder to all platforms (stylesheets etc.) 
  config.assets "templates"
  config.assets "resources/fonts"
  # Include javascript libraries
  # These get included before everything else in the app, and are *not* minified

  # config.javascripts "http://maps.google.com/maps/api/js?sensor=true"
  # config.javascripts "lib/jquery-min.js"
  # config.javascripts "https://cdn.firebase.com/v0/firebase.js"

  # Run `compass compile` in this directory before doing anything
  # config.compass "resources/sass"

  # copy and include these stylesheets in the html
  config.stylesheets "resources/css/ionic.css"
  config.stylesheets "resources/css/app.css"

  # Basic key/value settings that will be available to your javascript
  # config.setting base_url: "http://dev.example.com/api" # HighFive.settings.base_url = "http://dev.example.com/api"

  # Configure plaform specific settings like this
  config.platform :ios do |ios|
    ios.assets "platforms/config.xml"
    ios.destination = "platforms/ios/www"
    # ios.assets "resources/ios"
  end

  config.platform :android do |android|
    android.destination = "platforms/android/assets/www"
    # android.assets "resources/android"
    #android.javascripts "platforms/android/platform_www/cordova.js"
  end

  config.platform :web do |web|
    web.destination = "www"
  end

  # if you need platform-specific javascripts, 
  # simply create app-<platform>.js 
  # these files are managed by sprockets, and are used to determine the javascript include order

  # Environment support: production/development/etc
  # Environments work just like platforms
  config.environment :development do |development|
    # development.javascripts "lib/some-library-debug-all.js"
    # development.setting base_url: "http://dev.example.com:1234/api/"
    config.dev_index = "index-debug.html"
  end

  config.environment :production do |production|
    # production.javascripts "lib/some-library-minified.js"
    # production.setting base_url: "http://production.example.com/api/" #these take precedence over the platform overrides
  end

end
