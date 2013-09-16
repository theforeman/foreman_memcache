# ForemanMemcache

Adds memcache support for [Foreman](http://theforeman.org).

This Foreman plugin allows to use memcache as a cache storaged and session information.
this is useful when you want to deploy foreman across multiple servers and / or speed up foreman cache performance.

You will need to install a memcached instance to use this plugin.

## Configuration

By default, the plugin will enable memcache-based caching pointing to memcached on the local host.

The memcache host(s) and options can be changed by adding settings to `/usr/share/foreman/config/settings.plugins.d/foreman_memcache.yaml`, or Foreman's own `settings.yaml`.

Example config file:

```yaml
:memcache:
  :hosts:
    - cache-1.example.com
    - cache-2.example.com
  :options:
    :namespace: foreman
    :expires_in: 86400
    :compress: true
```

The :options hash contains settings as per the [Dalli configuration reference](https://github.com/mperham/dalli#configuration).  The namespace will default to 'foreman' unless specified.

## Copyright

Copyright (c) 2013 Red Hat Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
