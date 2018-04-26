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

    initializer 'setup_memcache', :before => :build_middleware_stack do |app|
      app.config.middleware.swap ActionDispatch::Session::ActiveRecordStore, ActionDispatch::Session::CacheStore
    end

    initializer 'foreman_memcache.register_plugin', :before => :finisher_hook do |app|
      Foreman::Plugin.register :foreman_memcache do
        requires_foreman '>= 1.16'
      end
    end
  end
end
