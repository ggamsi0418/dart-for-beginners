# ๐ Dart ์์ํ๊ธฐ

## โ ํ๊ฒฝ ์ธํ โ

### 1. ๋ฒ์  ๊ด๋ฆฌ ๋งค๋์  ์ค์น (asdf)

- https://asdf-vm.com/
- ubuntu(WSL2) ๊ธฐ์ค
- Officail Download
  ```shell
  $ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
  ```
- Install asdf (ZSH & Git)

  - `.zshrc` ํ์ผ ์์ ๋ค์ ๋ด์ฉ๋ค์ ์ถ๊ฐ

  ```bash
  . $HOME/.asdf/asdf.sh

  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)

  # initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit

  ```

- ๋ณ๊ฒฝ ๋ด์ฉ ์ ์ฉํ๊ธฐ
  ```
  $ source ~/.zshrc
  ```

### 2. flutter ์ค์น

- asdf ํ๋ฌ๊ทธ์ธ์ flutter ์ถ๊ฐ

  ```shell
  $ asdf plugin-add flutter
  ```

- ์ค์น ๊ฐ๋ฅํ ๋ฒ์  ํ์ธ

  ```shell
  $ asdf list all flutter
  ```

- ํน์  ๋ฒ์ ์ flutter ์ค์น

  ```shell
  $ asdf install flutter 3.3.10-stable
  ```

- Global ๋๋ Local ๋ฒ์  ์ค์ 

  ```shell
  # Defines a global flutter version to be used
  asdf global flutter <VERSION_NUMBER>

  # Defines a local flutter version to be used
  asdf local flutter <VERSION_NUMBER>
  ```

- ์ค์น ํ์ธ
  ![image](https://user-images.githubusercontent.com/58096698/209801824-6a3e796d-446b-44cb-9582-56fdc483996b.png)

- flutter ๊ฒฝ๋ก ์ค์ (for vscode) - `.zshrc ํ์ผ`์ ์ถ๊ฐ (https://github.com/oae/asdf-flutter#troubleshooting)

  ```zsh
  export FLUTTER_ROOT="$(asdf where flutter)"
  ```

- ๊ธฐ๋ณธ์ ์ผ๋ก flutter๋ฅผ ์ค์นํ๋ฉด dart๋ ํจ๊ป ์ค์น๋จ
  ๋ง์ฝ ํน์  Dart๋ฅผ ์ค์นํ์ฌ ์ฌ์ฉํ๊ณ  ์ถ๋ค๋ฉด ๋ค์์ ์ฐธ๊ณ .
  https://dev.to/elianmortega/asdf-flutter-version-manager-macos-linux-4og0
