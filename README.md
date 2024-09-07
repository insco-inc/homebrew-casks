# homebrew-picguard

[![Test](https://github.com/picguard/homebrew-picguard/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/picguard/homebrew-picguard/actions/workflows/test.yml)
[![Excavator](https://github.com/picguard/homebrew-picguard/actions/workflows/excavator.yml/badge.svg)](https://github.com/picguard/homebrew-picguard/actions/workflows/excavator.yml)
[![Add version](https://github.com/picguard/homebrew-picguard/actions/workflows/version.yml/badge.svg)](https://github.com/picguard/homebrew-picguard/actions/workflows/version.yml)

## Install

`brew install picguard/picguard/picguard`

Or `brew tap picguard/picguard` and then `brew install picguard`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "picguard/picguard"
brew "picguard"
```

## Debug

`brew audit --strict --fix --cask picguard`

`brew livecheck --debug picguard`

## Documentation

Your taps are Git repositories located at `$(brew --repository)/Library/Taps`

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
