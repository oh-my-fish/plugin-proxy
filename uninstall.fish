# Unset proxy variables
set -l envars http_proxy HTTP_PROXY \
  https_proxy HTTPS_PROXY \
  ftp_proxy FTP_PROXY \
  all_proxy ALL_PROXY

for envar in $envars
  set -e $envar
end

# Erase proxy functions
functions -e noproxy proxy __proxy.set
