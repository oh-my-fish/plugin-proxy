function proxy -d "Setup proxy environment variables"
  if not set -q proxy_host
    echo "Error: You must set proxy_host to your proxy hostname:port in config.fish"
    echo "You may also set proxy_user to your username"
    return
  end

  if test "$proxy_auth" = "true"
    # Get user & password
    set -l user $proxy_user
    if not set -q proxy_user
      read -p "echo -n 'Proxy User: '" user
    end
    # Read password from different source
    switch (uname)
      case Darwin
        set -l proxy_domain (string split -r -m 1 : "$proxy_host" | head -1)
        set pass (security find-internet-password -a "$proxy_user" -ws "$proxy_domain")
        if test $status -ne 0
          echo "Unable to find proxy password in keychain"
          read -sp "echo -n 'Proxy password: '" pass
        end
      case '*'
        read -sp "echo -n 'Proxy password: '" pass
    end
    # URL encode password
    set -l encpass (string escape --style=url "$pass")

    __proxy.set "http://$user:$encpass@$proxy_host"
  else
    __proxy.set "http://$proxy_host"
  end
end

