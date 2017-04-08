### If you use NeoVim

```bash
cd $HOME/.config
git clone https://github.com/r0xsh/nvim
nvim -c "PlugInstall"
```

### If you use Vim

```bash
cd $HOME/.config
git clone https://github.com/r0xsh/nvim
ln -s $HOME/.config/nvim $HOME/.vimrc
ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc
vim -c "PlugInstall"
```

### Setup YouCompleteMe

https://github.com/Valloric/YouCompleteMe/blob/master/README.md

##### Rust support

```bash
source $HOME/.cargo/env
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
```

### Setup Tagbar

https://github.com/majutsushi/tagbar/wiki

