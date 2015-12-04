function init -a path --on-event init_proxy
    if set -q proxy_host
       _proxy_set "http://$proxy_host"
    end
end

