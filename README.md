# oh-my-tmux

A small tmux setup focused on sensible defaults, faster pane movement, and an easier day-to-day terminal workflow.

## What's included

- Mouse support
- Lower key-sequence latency for Vim/Neovim and Alt-based bindings
- Larger scrollback history
- Focus event support
- Window and pane numbering starting at `1`
- Automatic window renumbering
- System clipboard integration
- Vi-style copy mode
- Split panes in the current working directory
- Alt+Arrow pane navigation
- Alt+Shift+Arrow pane resizing
- Quick config reload with `prefix + r`

## Installation

Make sure `tmux` is installed, then clone the repository and run the installer:

```bash
git clone https://github.com/iWasAWizard/oh-my-tmux.git
cd oh-my-tmux
./setup.sh
```

The installer backs up an existing `~/.tmux.conf` and then links this repository's config into place.

## Manual setup

If you do not want to use the installer, you can link the config yourself:

```bash
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf
```

## Usage

- Start a new session with `tmux`
- Reload an existing session with `tmux source-file ~/.tmux.conf`
- Inside tmux, press `prefix + r` to reload the config

## License

MIT
