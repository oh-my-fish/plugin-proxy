<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### proxy
> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

The proxy plugin provides a couple helper functions to those of us who are
stuck behind HTTP/HTTPS/FTP proxies that require authentication.  The variables
it exports are used by many command-line and GUI applications on Linux, as well
as [MacPorts][macports] and [Homebrew][homebrew] on OS X.

Both uppercase and lowercase versions of the proxy environment variables are
set, some applications are case sensitive.  If you'd like to learn more about
the use of these variables, this [Arch Wiki Article][archwiki-article] is a
good place to start.

[macports]:         http://www.macports.org/
[homebrew]:         http://brew.sh/
[archwiki-article]: https://wiki.archlinux.org/index.php/proxy_settings


## Install

```fish
$ omf install proxy
```


## Usage

### No authentication

If you just want to have the proxy plugin configure all the environment
variables, you may set proxy_host and proxy_auth in
`$OMF_CONFIG/before.init.fish`:

```fish
set proxy_host myproxy.example.com:8000
set proxy_auth false
```

The proxy plugin will prepend `http://` for you.  Here's the result:

    ~> set -x |grep proxy
    ALL_PROXY http://myproxy.example.com:8000
    FTP_PROXY http://myproxy.example.com:8000
    HTTPS_PROXY http://myproxy.example.com:8000
    HTTP_PROXY http://myproxy.example.com:8000
    all_proxy http://myproxy.example.com:8000
    ftp_proxy http://myproxy.example.com:8000
    http_proxy http://myproxy.example.com:8000
    https_proxy http://myproxy.example.com:8000

### With authentication

Set your proxy host and username in `$OMF_CONFIG/before.init.fish`:

```fish
set proxy_host myproxy.example.com:8000
set proxy_auth true
set proxy_user mylogin
```

When you need to make use of the proxy, just run `proxy`.  It will prompt you
for a password and setup your environment.

If you didn't setup a proxy_user variable, you will be prompted for a username.

If you wish to clear your proxy variables, run `noproxy`.


# License

[MIT][mit] © [oh-my-fish][author] et [al][contributors]

[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/oh-my-fish
[contributors]:   https://github.com/oh-my-fish/plugin-proxy/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
