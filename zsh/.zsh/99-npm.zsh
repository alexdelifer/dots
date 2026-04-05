export NPM_CONFIG_PREFIX="$HOME/.npm-global"

# npm global binaries live under the prefix's bin directory.
path=("$HOME/.npm-global/bin" ${path:#$HOME/.npm-global} ${path:#$HOME/.npm-global/bin})
