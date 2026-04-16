# MountyPathon — OneDrive mount manager
# Add to ~/.bashrc or ~/.zshrc with:  source /path/to/mountypathon.bash

mountypathon() {
  local SERVICE="rclone-onedrive"
  local MOUNT="$HOME/OneDrive"
  local CACHE="$HOME/.cache/rclone/vfs"

  case "${1}" in
    start)
      systemctl --user start "$SERVICE" && echo "OneDrive mounted." || echo "Failed to start."
      ;;
    stop)
      systemctl --user stop "$SERVICE" && echo "OneDrive unmounted." || echo "Failed to stop."
      ;;
    restart)
      systemctl --user restart "$SERVICE" && echo "OneDrive remounted." || echo "Failed to restart."
      ;;
    status)
      local svc
      svc=$(systemctl --user is-active "$SERVICE")
      if [ "$svc" = "active" ]; then
        if mountpoint -q "$MOUNT"; then
          echo "active (mounted)"
        else
          echo "active (mount unresponsive)"
        fi
      else
        echo "$svc"
      fi
      ;;
    logs)
      journalctl --user -u "$SERVICE" -f
      ;;
    doctor)
      local svc
      svc=$(systemctl --user is-active "$SERVICE")
      echo "  service  : $svc"
      if mountpoint -q "$MOUNT"; then
        echo "  mount    : ok ($MOUNT)"
      else
        echo "  mount    : not mounted ($MOUNT)"
      fi
      if [ -d "$CACHE" ]; then
        local cache_sz
        cache_sz=$(du -sh "$CACHE" 2>/dev/null | cut -f1)
        echo "  cache    : ${cache_sz:-unknown} ($CACHE)"
      else
        echo "  cache    : 0 (no cache) ($CACHE)"
      fi
      if mountpoint -q "$MOUNT"; then
        if timeout 10 rclone lsd onedrive: &>/dev/null; then
          echo "  remote   : reachable"
        else
          echo "  remote   : unreachable"
        fi
      fi
      ;;
    reauth)
      rclone config reconnect onedrive:
      ;;
    *)
      echo "Usage: mountypathon [start|stop|restart|status|logs|doctor|reauth]"
      return 1
      ;;
  esac
}
