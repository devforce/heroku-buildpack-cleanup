# heroku-buildpack-cleanup

Remove files that are specified in a .slugcleanup file.

This should be the last buildpack so that the slug size can be minimized.

This will generally be used along with

https://github.com/devforce/heroku-buildpack-cachesave
https://github.com/devforce/heroku-buildpack-cacheload


## Usage

    $ heroku buildpacks:add https://github.com/syginc/heroku-buildpack-cleanup.git

    $ cat .slugcleanup
    gradle*
    node_modules

## License

MIT
