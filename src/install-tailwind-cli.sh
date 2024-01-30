
#!/usr/bin/env bash

set -e

source $devscript_helpers

start_and_validate() {
  print_line "=> Script: install tailwind-cli"
  validate_wd_git
}

finish_and_commit() {
  commit_changes "script: install tailwind-cli"
  print_line "=> done"
}

install_packages() {
  run_npm_install -D tailwindcss
  add_to_commit package.json package-lock.json
}

copy_files() {
  local dest_path=$wd
  run_cmd cp -r $nex_script_path/tpl/tailwind-cli/* $dest_path
  add_to_commit $dest_path
}

main() {
  local wd="$1"
  local wd_ans=""
  local flags="$2"
  start_and_validate
  install_packages
  copy_files
  finish_and_commit
}

main "$@"
