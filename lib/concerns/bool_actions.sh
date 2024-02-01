
abort_if_true() {
  local v="$1"
  local msg="$2"
  if [ "$v" == "true" ]; then
    echo $msg
    exit 1
  fi
}

abort_if_not_true() {
  local v="$1"
  local msg="$2"
  if [ "$v" != "true" ]; then
    echo $msg
    exit 1
  fi
}