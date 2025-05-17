# .zshrc for developers [.zshrc-dev]

A powerful, developer-focused `.zshrc` configuration tailored for macOS users who spend a lot of time in the terminal. This setup includes:

- Colorful, git-aware prompt showing user, host, current folder, and git branch  
- Handy navigation and system aliases  
- ImageMagick-powered recursive image resizing functions  
- Integration with popular language version managers like `nvm` and `pyenv`  
- Support for enhanced tools such as `fzf`, `bat`, `zoxide`  
- Syntax highlighting and autosuggestions for a smoother terminal experience  
- Dynamic terminal title updating

## Features

- **Prompt:** Displays user@host, current folder (in light blue), git branch (yellow), with a right triangle prompt sign  
- **Aliases:** Frequent shortcuts for git, file navigation, system info, safer delete, and networking  
- **Image resizing:** `resize1920` and `resize1200` functions resize images only if larger than target width, preserving originals  
- **Language managers:** Auto-loads `nvm` and `pyenv` if installed  
- **Enhanced tools:** Uses modern replacements like `bat` for `cat` and `eza` for `ls` if available  
- **History:** Shared across sessions, with duplicate entries ignored  
- **Utilities:** Kill process on port, fast directory navigation with `zoxide`  

## Installation

1. Clone or download the repo  
2. Copy `.zshrc` to your home directory (backup existing `.zshrc` first!)  
3. Restart your terminal or run `source ~/.zshrc`  
4. Ensure dependencies like `magick`, `eza`, `fzf`, `bat`, `zoxide`, `nvm`, and `pyenv` are installed for full experience  

## Dependencies

- [ImageMagick](https://imagemagick.org/) (`magick` CLI)  
- [eza](https://the.exa.website/) (optional replacement for `ls`)  
- [fzf](https://github.com/junegunn/fzf)  
- [bat](https://github.com/sharkdp/bat)  
- [zoxide](https://github.com/ajeetdsouza/zoxide)  
- [nvm](https://github.com/nvm-sh/nvm)  
- [pyenv](https://github.com/pyenv/pyenv)  

## License

MIT License

---

Feel free to customize or ask for additions!

