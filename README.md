<h1 align="center">🏮 ReLight</h1>
<p align="center">The <strong>no-compromises</strong> launcher for Linux.</p>
<p align="center"><img src="./assets/relight.svg" alt="ReLight"></p>

Rofi was the first glow-up to the classic launchers/menus like dmenu. ReLight is that light to rofi - standing on the shoulders of the giants.

**Relight comes from the drive and passion to innovate, and not from discontent but rather from a
perspective of relentlessness.**

> Look beyond what you see. - Rafiki, The Lion King

<details>
<summary>Table of contents</summary>

- [Feauture Overview](#🎉-features)
- [Getting Started](#getting-started)
  - [Compatibility](#💻-compatibility)
  - [Prerequisites](#⚡️-prerequisites)
  - [Installation](#📦-installation)
    - [Quickstart](<#🚀-quickstart-(recommended)>)
    - [Manual Installation](#💪-manual-installation)
- [Configuration](#🛠️-configuration)
  - [Rofi Configuration](#🧪-rofi-configuration)
    - [Vim Bindings](#vim-bindings-in-rofi)
    - [Font](#font)
  - [ReLight Configuration](#🎨-relight-configuration)
    - [Add/Remove Extensions](#add/remove-extensions)
    - [Themes](#themes)
  - [Extensions](#🔌-extensions)
    - [Available Extensions](#available-extensions)
    - [Calc](#calc)
    - [Bitwarden](#bitwarden)
    - [Emoji](#emoji)
    - [Httpie](#httpie)
    - [Silicon](#silicon)
    - [Tldr](#tldr)
- [Troubleshoot](#🚦-troubleshoot)
- [FAQ](#📑-faq)

</details>

## 🎉 Features

🚧 WIP

## Getting Started

### 💻 Compatibility

| Platform | Status |
| :------- | :----: |
| Linux    |   ✅   |
| macOS    |   ❌   |
| Windows  |   ❌   |

\***_Compatibility on Windows is_** **WIP** 🚧

### ⚡️ Prerequisites

**General requirments:**

- [Git](https://git-scm.com/) (for installation)
- [Rofi](https://github.com/davatorium/rofi)
- A [Nerd Font](https://www.nerdfonts.com/) for the best experience (_optional_)

**Extension specific requirments:**

_Checkout the requirments for each extension from [here](#available-extensions)_

### 📦 Installation

#### 🚀 Quickstart (Recommended)

This is the **easiest** and the **recommended** method of installation. This script, by default, installs **ReLight** to your home directory. You can also install to a custom directory; described in detail in the [manaul installation](#manual-installation) section.

Execute install script:

```sh
curl -fsSL https://raw.github.com/wasituf/relight/install.sh | sh
```

If you don't have **curl** installed, you can install it with `sudo apt install curl` (Ubuntu/Debian), or download from [official download page](https://curl.se/download.html).

**Note** that this command installs ReLight from it's official GitHub repository.

### 💪 Manual Installation

The manual method consists of first, downloading this repository to your system, and then adding the a symlink to the launch script in _/usr/local/bin_

1. Download the repository, either using git:

```sh
git clone https://github.com/wasituf/relight
```

or, [download](https://github.com/wasituf/dotfiles/archive/refs/heads/main.zip) _zip_ from GitHub.

**_It is important to note that the location where you clone/download the repository is it's install location as well. ReLight doesn't have to installed beyond that as was made using static bash/sh files_**

2. Change to the relight directory and create a symlink to _/usr/local/bin_:

```sh
# From the relight directory
sudo ln -s "./launch" "/usr/local/bin/relight"
```

3. Test your installation by running **ReLight** from your terminal:

```sh
relight
```

If this throws an error or doesn't open relight, check out the [Troubleshoot](#troubleshoot) section to see potential solutions.

### 🛠️ Configuration

#### 🧪 Rofi Configuration

**ReLight** does'nt rely on your **Rofi** configuration to function. This means you can keep your rofi config just how you like it. **ReLight** instead embeds all its rofi configuration in it's code.

The next few sections are about _optional_ settings for **Rofi** that might make your life easier.

##### Vim Bindings in Rofi

If you want vim bindings in **Rofi**, the configuration below is a good starting point.

```
configuration {
	/* I don't have anything setup for completion (unset Control+l) */
	kb-mode-complete: "";

    /* Unset Control+j */
    kb-accept-entry: "Control+m,Return,KP_Enter";

	/* I don't anything setup for this either (unset Control+k) */
    kb-remove-to-eol: "";

    /* Unset Control+h
    kb-remove-char-back: "BackSpace,Shift+BackSpace";

	# These vim bindings to easily move around
    kb-row-up: "Up,Control+k";
    kb-row-down: "Down,Control+j";
    kb-row-right: "Control+l";
    kb-row-left: "Control+h";
}
```

\*_These bindings are for the default vim motions in the QWERTY layout._

##### Font

For the best experience using **ReLight**, a [Nerd Font](https://www.nerdfonts.com/) is recommended. A font size of 10-12 is recommended (depending on the font). You can set your preferred font in **Rofi** like this:

```
configuration {
...
font: "JetBrainsMono Nerd Font 11";
...
}
```

#### 🎨 ReLight Configuration

**ReLight** can be configured using the `relightconf` file located at `$HOME/.config/relight/` directory. If you installed **ReLight** via the quickstart method, this file should be created for you along with some _sane_ defaults.

If you installed **ReLight** manually, you have to create a `relightconf` file at `$HOME/.config/relight/` directory.

For examples of fully configured `relightconf`, check out - [Examples](#examples).

\*_The configurations below assume that you are in the `relightconf` file._

##### Add/Remove Extensions

You can choose which extensions are visible using:

```
...
[extensions]
calc
emoji
silicon
tldr
...
```

For a full list of available extensions, check out - [Extensions](#available-extensions).

##### Themes

\*_Themes support is coming soon._

```
# Potential implementation
# [theme]
# theme-name
# theme-option1
# theme-option2
```

#### 🔌 Extensions

##### Available Extensions

This is an exhaustive list of all available extensions in **ReLight**. Be aware that each extension can have it's own requirments, so check the [prerequisites](#prerequisites) section for each extension before enabling them.

✅ - Works as Expected.  
⚠️ - Some features don't work.  
⛔ - Does not work.

| Extension               | Description                                            | State |
| :---------------------- | :----------------------------------------------------- | :---: |
| [Calc](#calc)           | qalculate's `qalc` based _natural language_ calculator |  ✅   |
| [Bitwarden](#bitwarden) | bitwarden password database                            |  ✅   |
| [Emoji](#emoji)         | `rofimoji` based emoji picker                          |  ✅   |
| [Httpie](#httpie)       | cli based api testing                                  |  ⛔   |
| [Silicon](#silicon)     | `rust` based `img2code` generation                     |  ⚠️   |
| [Tldr](#tldr)           | `tldr` pages, alternative to `man`                     |  ✅   |

---

_Below are the required configurations for each extension._

##### Calc 💱

Install the [calc](https://github.com/svenstaro/rofi-calc) package.

---

##### Bitwarden 🔒

1. Install the following packages:

- [rbw](https://github.com/doy/rbw)
- [rofi-rbw](https://github.com/fdw/rofi-rbw/) and it's [dependencies](https://github.com/fdw/rofi-rbw/?tab=readme-ov-file#dependencies)

2. Create a [Bitwarden account](https://vault.bitwarden.com/#/register?layout=default). You can skip
   this step if you already have one.

3. From the terminal run `rbw config set pinentry "gtk2"`.

4. To login to your Bitwarden account, run:

```sh
# replace <your-email-address> with your bitwarden email address
rbw config set email <your-email-address>

# enter your bitwarden password when prompted
rbw login
```

<details>
<summary><em>If you have a custom bitwarden server</em></summary>

```sh
# replace <server-url> with you're custom bitwarden server's URL
rbw config set base_url <server-url>
```

</details><br>

_You might need to run `rbw login` or `rbw sync` if periodically if you run into problems._

---

##### Emoji 🤯

1. Install the [rofimoji](https://github.com/fdw/rofimoji) package.

2. Create a `rofimoji.rc` file at `$HOME/.config/`

\*_This will likely be configurable through `relightconf` in the future!_

3. In the `rofimoji.rc` file, add:

```
files = [emojis, nerd_font, fontawesome6]
no-frecency = True
hidden-descriptions = True
prompt = ''
```

You can add any files you like from [rofimoji
data](https://github.com/fdw/rofimoji/tree/main/src/picker/data). Just add it's name to the `files`
list. You can also configure other rofimoji settings from [here](https://github.com/fdw/rofimoji?tab=readme-ov-file#options), but I strongly suggest keeping the above config in your file.

---

##### Httpie 📡

🚧 WIP

Uses the [httpie cli.](https://httpie.io/cli)

---

##### Silicon 🖨️

Install the [silicon](https://github.com/Aloxaf/silicon) package and it's [dependencies](https://github.com/Aloxaf/silicon?tab=readme-ov-file#dependencies)

**ReLight** does not change the dafault style of silicon outputs as multples of arguments can cause
error. If you want to style you're silicon outputs, check out [silicon configuration](https://github.com/Aloxaf/silicon?tab=readme-ov-file#configuration-file)

---

##### Tldr 📖

Make sure you are able to use `xdg-open`. To test it out, from a terminal window, run:

```
xdg-open https://github.com/wasituf/relight
```

This should open the official **ReLight** GitHub page in your **default** browser.

---

### 🚦 Troubleshoot

**\*_Nothing to see here yet._** 🙈

### 📑-FAQ

**\*_Nothing to see here yet._** 🙈
