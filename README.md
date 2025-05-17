
# zshrc-dev 🚀

A **powerful and developer-centric** `.zshrc` configuration for macOS terminal users who want to boost productivity and enjoy a sleek, colorful shell experience. Perfect for software engineers juggling multiple projects, working with Git, managing images, and switching between languages.

---

## 🌟 Features

- **🎨 Colorful, git-aware prompt**  
  Displays your username, host, current folder (in light blue), and the current Git branch (in yellow), with a stylish right triangle prompt sign ▶ — keeping you informed at a glance.

- **🔧 Handy aliases & shortcuts**  
  Quickly navigate directories, manage Git, inspect system info, search history, and perform safer file operations without typing long commands.

- **🖼️ ImageMagick-powered image resizing**  
  Recursively resize images with `resize1920` and `resize1200` commands — smartly skips images that are already small or previously resized.

- **⚙️ Language version managers**  
  Automatic integration with `nvm` for Node.js and `pyenv` for Python, so you can easily manage multiple environments.

- **🚀 Enhanced terminal tools support**  
  Uses modern replacements like `bat` (for `cat`) and `eza` (for `ls`) if installed — plus `fzf` fuzzy finder and `zoxide` for lightning-fast directory jumping.

- **📚 Shared command history**  
  Keeps your command history unified across terminal sessions, ignoring duplicate entries for clean recall.

- **🛠️ Developer utilities**  
  Includes handy functions like killing a process by port (`killport`), plus dynamic terminal title updates for better context.

---

## 🛠️ Installation

1. Clone or download this repo.  
2. Backup your current `.zshrc`:  
   ```bash
   cp ~/.zshrc ~/.zshrc.backup
   ```  
3. Copy the new `.zshrc` to your home directory:  
   ```bash
   cp path/to/zshrc-dev/.zshrc ~/.zshrc
   ```  
4. Restart your terminal or reload your config:  
   ```bash
   source ~/.zshrc
   ```  
5. (Optional) Install dependencies for full feature support (see below).

---

## 📦 Dependencies

To unlock all features, consider installing these tools:

- [ImageMagick](https://imagemagick.org/) (`magick`) — for image resizing  
- [eza](https://the.exa.website/) — modern `ls` replacement with icons  
- [fzf](https://github.com/junegunn/fzf) — fuzzy finder for quick searching  
- [bat](https://github.com/sharkdp/bat) — syntax-highlighted `cat` alternative  
- [zoxide](https://github.com/ajeetdsouza/zoxide) — fast directory jumper  
- [nvm](https://github.com/nvm-sh/nvm) — Node.js version manager  
- [pyenv](https://github.com/pyenv/pyenv) — Python version manager  

You can install most via [Homebrew](https://brew.sh/):

```bash
brew install imagemagick eza fzf bat zoxide nvm pyenv
```

---

## 💡 Usage Tips

- Run `resize1920` or `resize1200` in your project folders to batch resize images.  
- Use `killport <port>` to quickly terminate processes blocking ports.  
- Use `z` (from `zoxide`) to jump to frequently used directories quickly.  
- Explore the aliases like `gs` (git status), `ll` (long listing with icons), and more to speed up your workflow.

---

## 📜 License

This project is licensed under the MIT License. Feel free to use and modify as you like!

---

Feel free to contribute, open issues, or suggest improvements! Happy coding! ✨
