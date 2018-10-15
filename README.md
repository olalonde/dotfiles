# Install

## Install [rcm](https://github.com/thoughtbot/rcm)

```
cd ~
git clone git@github.com:olalonde/dotfiles.git
mv dotfiles .dotfiles
ln -s ~/.dotfiles/rcrc ~/.rcrc
```

Debian/Ubuntu:

```bash
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get install rcm
```

OS X:
```bash
brew tap thoughtbot/formulae
brew install rcm
```

## Install dotfiles

```bash
rcup -v -d dotfiles
```

