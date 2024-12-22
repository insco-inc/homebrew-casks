# homebrew-casks

[![Test](https://github.com/kjxbyz/homebrew-casks/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/kjxbyz/homebrew-casks/actions/workflows/test.yml)
[![Excavator](https://github.com/kjxbyz/homebrew-casks/actions/workflows/excavator.yml/badge.svg)](https://github.com/kjxbyz/homebrew-casks/actions/workflows/excavator.yml)
[![Generate casks info](https://github.com/kjxbyz/homebrew-casks/actions/workflows/build.yml/badge.svg)](https://github.com/kjxbyz/homebrew-casks/actions/workflows/build.yml)
<!-- [![Add version](https://github.com/kjxbyz/homebrew-casks/actions/workflows/version.yml/badge.svg)](https://github.com/kjxbyz/homebrew-casks/actions/workflows/version.yml) -->

## Casks

<table>
  <tr>
    <th>Casks</th>
    <th style="text-align: center">Version</th>
  </tr>
  <tr>
    <td>picguard</td>
    <td>
      <img alt="Homebrew Cask Version" src="https://img.shields.io/badge/dynamic/json.svg?url=https://raw.githubusercontent.com/kjxbyz/homebrew-casks/main/Info/picguard.json&query=$.casks.[0].version&label=homebrew">
    </td>
  </tr>
  <tr>
    <td>fafarunner</td>
    <td>
      <img alt="Homebrew Cask Version" src="https://img.shields.io/badge/dynamic/json.svg?url=https://raw.githubusercontent.com/kjxbyz/homebrew-casks/main/Info/fafarunner.json&query=$.casks.[0].version&label=homebrew">
    </td>
  </tr>
  <tr>
    <td>artify</td>
    <td>
      <img alt="Homebrew Cask Version" src="https://img.shields.io/badge/dynamic/json.svg?url=https://raw.githubusercontent.com/kjxbyz/homebrew-casks/main/Info/artify.json&query=$.casks.[0].version&label=homebrew">
    </td>
  </tr>
</table>

## Install

`brew install kjxbyz/casks/<cask>`

Or `brew tap kjxbyz/casks` and then `brew install <cask>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "kjxbyz/casks"
brew "<cask>"
```

## Debug

`brew audit --strict --fix --cask <cask>`

`brew livecheck --debug <cask>`

## Documentation

Your taps are Git repositories located at `$(brew --repository)/Library/Taps`

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
