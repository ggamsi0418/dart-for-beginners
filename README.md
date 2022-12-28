# 🚀 Dart 시작하기

## ⚙ 환경 세팅 ⚙

### 1. 버전 관리 매니저 설치 (asdf)

- https://asdf-vm.com/
- ubuntu(WSL2) 기준
- Officail Download
  ```shell
  $ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
  ```
- Install asdf (ZSH & Git)

  - `.zshrc` 파일 안에 다음 내용들을 추가

  ```bash
  . $HOME/.asdf/asdf.sh

  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)

  # initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit

  ```

- 변경 내용 적용하기
  ```
  $ source ~/.zshrc
  ```

### 2. flutter 설치

- asdf 플러그인에 flutter 추가

  ```shell
  $ asdf plugin-add flutter
  ```

- 설치 가능한 버전 확인

  ```shell
  $ asdf list all flutter
  ```

- 특정 버전의 flutter 설치

  ```shell
  $ asdf install flutter 3.3.10-stable
  ```

- Global 또는 Local 버전 설정

  ```shell
  # Defines a global flutter version to be used
  asdf global flutter <VERSION_NUMBER>

  # Defines a local flutter version to be used
  asdf local flutter <VERSION_NUMBER>
  ```

- 설치 확인
  ![image](https://user-images.githubusercontent.com/58096698/209801824-6a3e796d-446b-44cb-9582-56fdc483996b.png)

- flutter 경로 설정(for vscode) - `.zshrc 파일`에 추가 (https://github.com/oae/asdf-flutter#troubleshooting)

  ```zsh
  export FLUTTER_ROOT="$(asdf where flutter)"
  ```

- 기본적으로 flutter를 설치하면 dart도 함께 설치됨
  만약 특정 Dart를 설치하여 사용하고 싶다면 다음을 참고.
  https://dev.to/elianmortega/asdf-flutter-version-manager-macos-linux-4og0
