# Introduction

These are my Personal Configurations for [`Visual Studio`](https://code.visualstudio.com/Download) [Code Editor](https://code.visualstudio.com/docs/supporting/FAQ#_what-is-the-difference-between-visual-studio-code-and-visual-studio-ide), [`Git Bash`](https://www.geeksforgeeks.org/working-on-git-bash/#how-to-install-git-bash) [Shell](https://www.geeksforgeeks.org/difference-between-terminal-console-shell-and-command-line/) and [`Vim`](https://www.vim.org/download.php)/[`NeoVim`](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-download) Text Editor. So it contains just ***Configuration files and Notes*** (not tutorials), that is it.

# Prerequisite

Before downloading them, you need to have the following knowledge and tools:
1. You have basic knowledge of how to operate with your machine (e.g. navigation, copy/paste, file/directory searching and so on).
2. You have basic knowledge of how to operate with your browser (e.g. navigation, manage downloads, read URL and so on)
3. You have *at least 1* software installed on your machine (otherwise, I don't know why you need the config files):
    - [VSCode](https://code.visualstudio.com/Download) / VSCode-based Code Editor.
    - [Bash](https://www.gnu.org/software/bash/) / Bash Emulator (e.g. Git Bash - Bash Emulation on Windows) Shell.
    - [Vim](https://www.vim.org/download.php) / Vim-based Text Editor.

# Installation(Download)

There are many ways to install/download a **Git Repository**, following are the common (**CLI: Git Clone**) and easy (**GUI: Zip file**) approach to perform it.

### CLI: Uses [Git SCM](https://git-scm.com/)
Make sure you have the [**Git**](https://git-scm.com/downloads) installed on your **Operating System** and the **Environment Variable** `PATH` is set. Then open your `Git Bash` or **Terminal**:
```
git clone https://github.com/<owner>/<repository>.git
```
Replace `owner` with the username or organisation name that owns the repository and `repository` with the name of the repository you want to clone. like below:
```shell
git clone https://github.com/IvanGSD/Configuration.git
```

### GUI: Download as a Zip file
1. Make sure you are on the main page of the repository (e.g. `https://github.com/IvanGSD/Configuration`).
2. Above the list of files, click the green `<> Code` button.
3. Click the `Download ZIP` at the bottom of the `Local` tab.
4. Your browser may prompt you to select the location of the archive, select the location and Save it.
5. After downloading it, unzip the archive then all done.

For more details and tutorials, you can search them online:
- [Download Archives - GitHub Docs](https://docs.github.com/en/repositories/working-with-files/using-files/downloading-source-code-archives#downloading-source-code-archives)
- [Download Github Files as ZIP File - Youtube](https://www.youtube.com/results?search_query=Download+Github+Files+as+ZIP+File)

# Setups

Create a directory named `.vscode` in your project's root (if it does **NOT** exist) and copy the contents from `Configuration/` to it. Or execute the following command in your **Terminal**:
```shell
cp -R Configuration/ .vscode/
```
If there are any conflicts of copying the files (e.g. `launch.json` and/or `tasks.json`), it is recommended to read them carefully and copy/paste what you need for your project.

Setup `launch.json` and `tasks.json`, simply just manually change the **path** inside the `json` file to match the **path** of your project. For instance (not full guide):
  - In `launch.json` file: `"${workspaceFolder}/C++/program"` may change to `"${workspaceFolder}/out/program"` for your project, if the executable is under the directory of `out` and named `program`.
  - In `tasks.json` file: `"${workspaceFolder}/C++/source.cpp"` may change to `"${workspaceFolder}/source.cpp"` for your project, if your source file is under the current working directory and named `source.cpp`.

For more information (official & accurate), visit: <https://go.microsoft.com/fwlink/?linkid=830387>.

### Configuration Directory

Configurations of `Bash`(.bashrc) and `Vim`(.vimrc). If you already have the configuration files, just copy/paste what you want/need.
- Simply copy/paste the files to your system home directory.
    - **Windows OS**: `C:\Users\<username>`.
    - **Unix/Unix-like OS**: `/home/<username>`.
- Or alternatively, execute the following command in your **Terminal** (make sure the current **Working Directory** where the `.vscode/` directory exists - 1 single directory-level above it):
```
cp .vscode/configuration/.* ~/
```
- For [NeoVim](https://neovim.io/doc/user/nvim.html#nvim-from-vim) or other Vim-based Text Editor, check their *manual/documentation* for the **transition solutions**.

Keyboard Shortcuts (`keybindings.json`) - copy/paste the contents to your `keybindings.json`.
  - On Windows: `%AppData%\Code\User\keybindings.json`.
  - On macOS: `~/Library/Application Support/Code/User/keybindings.json`.
  - On Linux: `~/.config/Code/User/keybindings.json`.

### Note Directory

Just containing **notes**. That is it.

## In practice
[Placeholder]

# End of Line Sequence (CR LF &rarr; LF)

Due to my Machine was a **Windows OS**, that is why you may find the **line-ending format** as `CRLF (Carriage Return Line Feed, \r\n)` rather than `LF (Line Feed, \n)` on the **Unix/Unix-like** operating system.

If you are on a **Unix/Unix-like** Operating System (e.g. Linux or macOS), you may need to change them manually, here are some solutions for you:
* Visual Studio Code (Cross-Platform)
  1. Open the file in **Visual Studio Code**.
  2. You will see the current line-ending format at the bottom-right corner of the Editor (e.g. `CRLF`).
  3. Click on it and select `LF` from the dropdown menu.
  4. Save it and Done.
* Notepad++ (Windows)
  1. Open the file in **Notepad++**.
  2. Go to the `Edit` menu, select `EOL Conversion`, and choose `Unix (LF)`.
  3. Save it and Done.
* Terminal (Unix/Unix-like OS - Linux, macOS and so on):
  - ```tr -d '\r' original_filename > new_filename``` or
  - ```sed 's/\r//' original_filename > new_filename``` or
  - ```perl -pe 's/\r//' original_filename > new_filename``` ...