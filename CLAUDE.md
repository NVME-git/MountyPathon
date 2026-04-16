# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

A systemd user service that mounts OneDrive as a virtual filesystem via rclone on Linux. Files are accessible at `~/OneDrive` and download on demand rather than being synced to disk.

## Managing the Mount

```bash
systemctl --user status rclone-onedrive   # check status
systemctl --user restart rclone-onedrive  # remount
systemctl --user stop rclone-onedrive     # unmount
```

## Service Design

The service file lives at `~/.config/systemd/user/rclone-onedrive.service`. Key options:
- `--vfs-cache-mode full` — caches both reads and writes for best app compatibility
- `--vfs-cache-max-size 5G` — caps local cache disk usage
- `--dir-cache-time 24h` — how long directory listings are cached before re-fetching
- `--poll-interval 15s` — how often to check for remote changes
