# Folders Tree

```lua
.
├── after
│   └── plugin
│       ├── defaults.lua
│       └── keymaps.lua
├── init.lua
├── init.vim_old
├── lua
│   ├── config
│   │   ├── alpha.lua
│   │   ├── autopairs.lua
│   │   ├── cmp.lua
│   │   ├── cmp_tabnine.lua
│   │   ├── coq.lua
│   │   ├── indent_blankline.lua
│   │   ├── lsp
│   │   │   ├── init.lua
│   │   │   ├── installer.lua
│   │   │   └── keymaps.lua
│   │   ├── lualine.lua
│   │   ├── luasnip.lua
│   │   ├── neogit.lua
│   │   ├── treesitter.lua
│   │   └── whichkey.lua
│   ├── lsp_config.lua
│   └── plugins_conf.lua
├── plugin
│   ├── packer_compiled.lua
│   └── packer_compiled.lua_old
└── README.md
```

# Requirements
***You should install [Neovim v0.9.0 nightly build](https://github.com/neovim/neovim/releases/tag/nightly) !!!***
**Before that you should install** *[dependencies](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites)*

## Quick Start

```bash
sudo apt-get install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl
```

or

```bash
sudo dnf -y install ninja-build libtool cmake gcc gcc-c++ make pkgconfig unzip gettext curl
```

Download
```bash
curl -v -L https://github.com/neovim/neovim/archive/refs/tags/nightly.tar.gz --output nightly.tar.gz && tar xzvf nvim-linux64.tar.gz && cd neovim-nightly
```

[Build from source](https://github.com/neovim/neovim)
```bash
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Install [Pyright](https://github.com/neovim/nvim-lspconfig)
```bash
npm i -g pyright
```


install [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf)
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fc-cache -fv
```
> This is needed for icons are showed


After that, open the ***lua/plugins_conf.lua*** file and press the follow keys: ***Space + z + s***


### Pitfalls
If you see the follow message: *cmp-tabnine: Cannot find installed TabNine. Please run install.sh* You must run the ***install.sh*** manually:
```bash
~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh
```


# Screenshots

### StartScreen
![two_screens](https://github.com/G2048/Nvim_config/blob/main/images/two_screens.jpg?raw=true)



### Example of LSP
![example_lsp_1](https://github.com/G2048/Nvim_config/blob/main/images/nvim_lsp.jpg?raw=true)


![example_lsp_2](https://github.com/G2048/Nvim_config/blob/main/images/nvim.jpg?raw=true)


![example_3](https://github.com/G2048/Nvim_config/blob/main/images/full_screen.png?raw=true)



# Keymappings

## Standart Vim Keys

### Insert mode
- `ctrl + e` - autotyping a below string
- `ctrl + y` - autotyping a above string
- `ctr + t` - tabulation
- `ctr + d` - delete tabulation
- `ctr + c` - go to normall mode
- `ctr + n/p` - standart completition
- `ctr + h` - detete behind the cursor
- `ctr + w` - detete before the cursor
- `ctr + u` - detete all before the cursor

### Normal mode
- `ctr + u` - move up (cursor not hold position)
- `ctr + d` - move down (cursor not hold position)
- `ctr + y` - move up (cursor a hold position)
- `ctr + e` - move up (cursor a hold position)
- `ctr + f` - scroll a one page on down
- `ctr + b` - scroll a one page on up
- `ctr + g` - show a information about a current file
- `ctr + a` - move on a cursor on first number and added a one number
- `ctr + a` - move on a cursor on first number and reduce a one number
- `ctr + r` - a cancellation the cuncellation
- `ctr + v` - highlight a code block
- `ctr + o` - to be returned into a source file
- `~~` - changing a registry of words
- `zz` - centering a window


## Tabs
- `Ctrl + t` - the "leader" of combination
	- `n` - open a new tab
	- `0` - tablast
	- `1` - tabfirst
	- `c` - tabclose
	- `t` - tabnext
	- `=` - tabNext
	- `+` - tabmove
	- `-` -tabprevious

## Windows
- `:split or :vsplit` - open a window
- `:qall` - close all windows
- `:wall` - save all windows
- `:wqall` - save and close all windows
- `Ctrl + w` - the leader combination
	- `w` - go to next window
	- `h` - go to left window
	- `j` - go to down window
	- `k` - go to up window
	- `l` - go to right window
	- `o` - scrolling the current window
	- `c` - close the current window
	- `s` - horizontal split
	- `v` - vertical split
	- `f` - split and open a under cursore file 
	- `+` - horizontal expand the current window
	- `-` - horizontal reduce the current window
	- `>` - vertical expand the current window
	- `<` - vertical reduce the current window
	- `K` - move on up/down the window
	- `H` - the current window on left top screen
	- `J` - the current window on down top screen
	- `L` - the current window on right top screen
	- `x` - swap windows

## Added keymaps
- `<leader>` - it's `<space>`
- `csi` + what we want to be replacemeted on another one
	- `<leader>to` - open lsp symbols into inside *telescope*
- `<leader>gr` - buffers reference
- `<leader>D` - defintion of object/method/function
- `jk` - return into normal mode
- `K` - moving up the line(s) inside visualmode 
- `J` - moving down the line(s) inside visualmode 
- `<Left>` - vertical resize plus
- `<Right>` - vertical resize minus
- `<Up>` - horizontal resize plus
- `<Down>` - horizontal resize minus
- `F2` - show/hidden a numbers of lines
- `F3` - highlight a cursor column
- `F4` - set up the relative numbers
- `F5` - show/hidden highlight a cursor line
- `F6` - 

### LSP Keymappings
- `l` - "leader" letter
- `leader` + `l` + `f` - code formatting (*You must using it!*)
- `gd` - go to defenition
- `Ctrl + t` - go to back
- `K` - show the current doc of object/function/method

### Git
- `leader + gs` -  invoke a **NeogitStatus** ( `git status + git commit + git diff` )
- `<Tab>` - to close/open scroll
- *Recent coomits* - to open to be pushed a `Enter`

### Better comment
- `gcc` - to comment/uncomment a current line
- `gc` - "comment" mode
**The HIT:** push down *Ctrl+v* for a better using

### Packer
- `<leader> + z`
	- `u` - update
	- `c` - compile
	- `i` - install
	- `S` - status
	- `s` - synch (update + compile) (It's better working)

### Easy Motion
- `s`, `S` , `f`, `F`, `t`, `T`

### Telescope
- `<leader>`
	- `ff` - finde files
	- `fg` - live grep
	- `fb` - buffers
	- `fh` - help tags
