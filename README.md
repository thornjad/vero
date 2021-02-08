<p align=center><img src="img/title.png" alt="Vero for zsh" /></p>

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/thornjad/vero?color=black&style=flat-square) ![GitHub](https://img.shields.io/github/license/thornjad/vero?style=flat-square) ![GitHub file size in bytes](https://img.shields.io/github/size/thornjad/vero/vero.zsh-theme?style=flat-square)

A simple, informative theme for Zsh.

Features:

- Current versions for `nvm` and `pyenv`
- Git branch and status
- Timestamp
- SSH indication
- Current user
- Current working directory

## Preview

<p align=center><img src="img/preview.png" alt="Preview of Vero" style="border-radius: 3px;" /></p>

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

## Copying

Copyright (c) 2017-2021 Jade Michael Thornton

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

The software is provided "as is", without warranty of any kind, express or
implied, including but not limited to the warranties of merchantability, fitness
for a particular purpose and noninfringement. In no event shall the authors or
copyright holders be liable for any claim, damages or other liability, whether
in an action of contract, tort or otherwise, arising from, out of or in
connection with the software or the use or other dealings in the software.
