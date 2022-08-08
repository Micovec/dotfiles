# Micovec's Linux Setup

General cook book for Micovec's personal linux setup.

Install Ubuntu and proceed by modifying programs.

For those that are not that much familiar with program configurations I made below some kind of step by step tutorial on what and where to change to make their linux environment look like mine.

**BUT** if you know how to copy my configs and will not read this "tutorial" do check configs thoroughly because there might be some catches as written in this "tutorial".

## Programs 

- [nvim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux) (can be easily installed with `apt install`. Currently Ubuntu's repos are up-to-date)
- [i3-gaps](https://github.com/Airblader/i3) (also can be easily installed with `apt install`)

## Neovim config

This is my Neovim config folder:
```
~/.config/nvim
├── init.lua
└── lua 
    ├── mapping.lua 
    ├── opts.lua
    ├── plug.lua
    └── _telescope.lua
```

First I needed a plugin manager for easy plugin installation, I chose light-weight [vim-plug](https://github.com/junegunn/vim-plug). For installation please refer to their github page. 

After that I have installed some additional plugins:

- [plenary](https://github.com/nvim-lua/plenary.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim) (super useful when working with large codebase)
- [rust](https://github.com/rust-lang/rust.vim)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
    - sadly for this plugin to work you need to install [nodejs](https://nodejs.org/en/) (highly recommend to download from their website since Ubuntu's repos don't get updated often. Last time I installed nodejs from repos they were 4 grand versions behind)

Thanks to already installed [vim-plug](https://github.com/junegunn/vim-plug) all those plugins listed above can be easily added to nvim with lua config:

(file: plug.lua)
```lua
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/autoload')

Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim', { tag = 'nvim-0.5.0' })
Plug ('rust-lang/rust.vim')
Plug ('iamcco/markdown-preview.nvim', 
    { ['do'] = vim.fn['mkdp#util#install'], 
    ['for'] = { 'markdown', 'vim-plug' }}
)

vim.call('plug#end')
```

Next for nicer nvim work environment I modified its looks a bit by showing relative line numbers and forced nvim to paste four spaces instead of \t when pressing tab key:

(file: opts.lua)
```lua
local opt = vim.opt

-- Show line numbers
opt.number = true
opt.relativenumber = true

-- Split new buffer below
opt.splitbelow = true

-- Tabs
opt.tabstop = 8
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true
```

Because telescope searches all subfolders inside nvim's start directory I added rust's `target/debug` folder to exclude from search:

(file: _telescope.lua)
```lua
require('telescope').setup{
	defaults = {
		file_ignore_patterns = {
			"target/debug"
		}
	}
}
```

You can add other folders to exclude from search by adding them surrounded with `"` to body of `file_ignore_patterns` seperated by `,` For example:

```lua
-- ...
file_ignore_patterns = {
    "target/debug",
    "node_modules"
}
-- ...
```

For easier telescope usage I mapped keys for faster search:

(file: mapping.lua)
```lua
local api = vim.api
local noremap_silent = { noremap = true, silent = true}

api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', noremap_silent)
api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', noremap_silent)
api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', noremap_silent)
api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', noremap_silent)
```

Lastly to put all this together it's just few `require` calls:

(file: init.lua)
```lua
require('mapping')
require('opts')
require('plug')
require('_telescope')
```

Don't forget to run:

```
:PlugInstall
```

once you are inside nvim to properly install plugins.

## tmux

Didn't modify a bit. Like the way it is.

I will point out some things tough. Learn how to use sessions, they are the best thing about tmux.

Some commands to remember:

```bash
# Start new session
tmux new -s <name_of_your_session>
# List sessions
tmux list-sessions
# Attach to session
tmux attach-session -t <name_of_your_session>
```

For detaching use `<CTRL>+b d`.

## i3-gaps

Because my config is too large to fit to this markdown file I will just refer you to check it out in [config](./i3/config).

Some things to point out:
- before i3 usage make sure you have installed feh and have you wallpaper at ~/Pictures/wallpaper.png otherwise your wallpaper won't get set. If you want to change wallpaper location, go to config and at the bottom change image's path.
- mouse sensitivity is decreased, to change it: at the bottom of the config `$mouse-sensitivity` value

I also made some tweaks to i3:
- `i3-blocks` for easier bar modification. Its config can be found at [i3blocks.conf](./i3/i3blocks.conf).
- `lxappearance` and change widget to `Yaru-dark`, icon theme to `Yaru` and mouse cursor to `DMZ (Black)`.
- [xkblayout](https://github.com/nonpop/xkblayout-state) to show keyboard layout since English is not my mother tonque
