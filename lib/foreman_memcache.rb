module ForemanMemcache
  class Engine < ::Rails::Engine
    isolate_namespace ForemanMemcache
    initializer 'setup_memcache', :before => :initialize_cache do |app|
      args = [:dalli_store]
      if (s = SETTINGS[:memcache])
        Array.wrap(s[:hosts]).each { |h| args << h }
        args << { :namespace => 'foreman' }.merge(s[:options] || {})
      end
      Rails.logger.info "memcached cache backend enabled: #{args}"
      app.config.cache_store = args
    end

    initializer 'setup_memcache', :after => :load_config_initializers do |app|
      # reuse cache store for sessions
      app.config.session_store ActionDispatch::Session::CacheStore
      # register plugin in Foreman
      Foreman::Plugin.register :foreman_memcache do
      end
    end
  end
end
