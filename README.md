**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Running this on Apple MacOS

```bash
$ brew install --cask iterm2 nvim
$ brew install git lazygit fd ripgrep llvm go rust zig cmake
$ brew install --cask font-jetbrains-mono-nerd-font
```

# To install it, of course
```bash
$ git clone https://github.com/NvChad/starter ~/.config/nvim
$ # and then, run the nvim
$ nvim
```
