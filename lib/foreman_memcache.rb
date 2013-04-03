module ForemanMemcache
  class Engine < ::Rails::Engine
    isolate_namespace ForemanMemcache
    initializer "setup_memcache", :before => :initialize_cache do |app|

      #  config.cache_store = :dalli_store, 'cache-1.example.com', 'cache-2.example.com',
      #      { :namespace => NAME_OF_RAILS_APP, :expires_in => 1.day, :compress => true  }
      app.config.cache_store = :dalli_store
    end

    initializer "setup_memcache", :after => :load_config_initializers do |app|
      # reuse cache store for sessions
      app.config.session_store ActionDispatch::Session::CacheStore
    end

  end
end
