# Vero for Oh My ZSH!

Vero is an [Oh My ZSH shell](https://github.com/robbyrussell/oh-my-zsh) theme, created for simplicity, neatness and availability of information.

Current features:

- Current Node.js version
- Git branch and status
- Timestamp
- Current user
- Current working directory
- A fancy lambda symbol

## Preview



## Requirements

- ZSH
- A ZSH framework like [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh), [antigen](https://github.com/zsh-users/antigen), [zplug](https://github.com/zplug/zplug) or [zgen](https://github.com/tarjoilija/zgen)

## Installation

### Using Oh My ZSH!

1. Download and install the theme:

  ```bash
  wget https://github.com/Raindeer44/vero/archive/v0.9.2.tar.gz
  tar -xzvf v0.9.2.tar.gz
  cd vero-0.9.2
  make
  ```

2. Set vero as your ZSH theme. In your **~/.zshrc**:

  ```bash
  ZSH_THEME="bullet-train"
  ```
  
<!--
### For antigen users

Add the following snippet to your **~/.zshrc** somewhere after the line
`antigen use oh-my-zsh`.

```bash
antigen theme https://github.com/raindeer44/vero vero
```

### For Zgen users

If you're using [zgen](https://github.com/tarjoilija/zgen), add the following line to your **~/.zshrc** where add your other ZSH plugins **after** the line `zgen oh-my-zsh`.

```bash
zgen load raindeer44/vero vero
```

### For Zplug users

If you're using [zplug](https://github.com/zplug/zplug), add the following line
to your **~/.zshrc** where you're adding your other zsh plugins **after** the
line `zplug "robbyrussell/oh-my-zsh"`.

```bash
setopt prompt_subst # Make sure propt is able to be generated properly.
zplug "adambiggs/zsh-theme", use:adambiggs.zsh-theme
```
-->
