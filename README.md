<p align=center><img src="img/title.png" alt="Vero for zsh" /></p>

A simple, informative theme for Zsh.

Features:

- Current Node.js version
- Git branch and status
- Timestamp
- SSH indication
- Current user
- Current working directory
- A fancy lambda symbol

## Preview

<p align=center><img src="img/preview.png" alt="Preview of Vero" /></p>

## Installation

### Using ZPlug

If you're using [zplug](https://github.com/zplug/zplug), add the following line
to your **~/.zshrc** where you're adding your other zsh plugins **after** the
line `zplug "robbyrussell/oh-my-zsh"`.

  ```bash
  setopt prompt_subst
  zplug "thornjad/vero", from:gitlab, at:main, as:theme, use:vero.zsh-theme
  ```

### Using ZGen

If you're using [zgen](https://github.com/tarjoilija/zgen), add the following line to your **~/.zshrc** near your other ZSH plugins **after** the line `zgen oh-my-zsh`.

  ```bash
  zgen load https://gitlab.com/thornjad/vero vero main
  ```
