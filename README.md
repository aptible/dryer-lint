# <img src="https://aptible-media-assets-manual.s3.amazonaws.com/arrow.svg" width="50" /> dryer-lint

Aptible's baseline Rubocop configuration.

## Usage

This is meant to be inherited from via a remote URL, 
as described [here](https://docs.rubocop.org/rubocop/configuration.html).

For example, if you have a non-Rails app, your Rubocop configuration should look
something like this:

```yaml
inherit_from:
  - https://raw.githubusercontent.com/aptible/dryer-lint/main/.rubocop.base.yml

AllCops:
  TargetRubyVersion: 3.1
  NewCops: enable
  Include:
    - !ruby/regexp /\.rb$/
    - !ruby/regexp /Gemfile$/
    - !ruby/regexp /\.gemspec$/
    - !ruby/regexp /\.rake$/
    - !ruby/regexp /Rakefile$/
```

If you are using Rails, the only change to the above is that you should also include
the Rails configuration in the `inherit_from` (`AllCops` stays the same as above):

```yaml
inherit_from:
  - https://raw.githubusercontent.com/aptible/dryer-lint/main/.rubocop.base.yml
  - https://raw.githubusercontent.com/aptible/dryer-lint/main/.rubocop.rails.yml
```

## Testing

A Docker Compose configuration is included to make testing locally easier.
To test, run `make init` once then `make rubocop`.

The GitHub Action for this repository mimics this behavior.
