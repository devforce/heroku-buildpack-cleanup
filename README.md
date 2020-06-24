# heroku-buildpack-cleanup

Remove files that are specified in a .slugcleanup file.

This should be the last buildpack so that the slug size can be minimized, or at
least after other buildpacks that produce files you want to cleanup.

    heroku buildpacks:add https://github.com/devforce/heroku-buildpack-cleanup

This buildpack will often be used along with

https://github.com/devforce/heroku-buildpack-cachesave
https://github.com/devforce/heroku-buildpack-cacheload

but they aren't required to be used together.  Just keep in mind the ordering
is important if they are used together.  If you run the cleanup buildpack
*before* the cacheload buildpack, you might delete things you mean to cache

## Usage

    $ heroku buildpacks:add https://github.com/syginc/heroku-buildpack-cleanup.git

    $ cat .slugcleanup
    gradle*
    node_modules


## Why not just use .slugignore ?

In short they do slightly different things

### .slugignore in build order

The .slugignore file causes files to be removed after you push code to Heroku
and *before* the buildpack runs.  This means that files the buildpack produces
end up in the slug, often greatly increasing slug size.

https://devcenter.heroku.com/articles/slug-compiler#ignoring-files-with-slugignore

1. Remove files in .slugignore
2. Run buildpacks
3. Compress build for slug

### .slugcleanup in build order

The .slugcleanup file from this repo will cause the files to be deleted *after*
the previous buildpacks have been run, but *before* the build is compressed to
produce the slug

2. Run buildpacks
1. Remove files in .slugcleanup
3. Compress build for slug

## License

MIT
