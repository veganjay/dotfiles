# Dotfiles with a Bare Git Repo

Based on [this HN comment](https://news.ycombinator.com/item?id=11070797) and [Atlassian guide](https://www.atlassian.com/git/tutorials/dotfiles).

## Setup (first time)

```sh
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Now use `config` instead of `git`:

```sh
config status
config add .vimrc
config commit -m "Add vimrc"
config push
```

## Install on a new machine

```sh
git clone --bare <git-repo-url> $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```

If checkout fails because of existing dotfiles, back them up:

```sh
mkdir -p .config-backup
config checkout 2>&1 | egrep "\s+\." | awk '{print $1}' | \
  xargs -I{} mv {} .config-backup/{}
config checkout
```

## Usage

Usage

- `config add <file>`
- `config commit -m "message"`
- `config ls-files ~/`
- `config push`
- `config pull`
