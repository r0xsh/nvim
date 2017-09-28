```bash
cd $HOME/.config
git clone https://github.com/r0xsh/nvim
nvim -c "PlugInstall"
```

##### Rust support

```bash
source $HOME/.cargo/env
rustup component add rust-src
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
```

### Setup Tagbar

https://github.com/majutsushi/tagbar/wiki

