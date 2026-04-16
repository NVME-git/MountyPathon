```
██████╗ ██████╗ ██████╗ ██████╗
██╔══██╗╚════██╗██╔══██╗╚════██╗
██████╔╝ █████╔╝██║  ██║ █████╔╝
██╔══██╗██╔═══╝ ██║  ██║██╔═══╝
██║  ██║███████╗██████╔╝███████╗
╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝

  personal linux toolkit & docs
```

OneDrive on Linux via rclone virtual filesystem mount — no sync daemon, no files on disk.

---

## Why This Exists

Microsoft doesn't make an official OneDrive client for Linux. On Windows, OneDrive just works — background sync, automatic backups, no thinking required. On Linux, you have to build that yourself.

This repo uses **rclone mount** to expose OneDrive as a virtual filesystem at `~/OneDrive`. Files appear instantly and download on demand — no local copy sitting on disk consuming space. A systemd user service keeps it mounted automatically on login.

---

## Contents

| File | What it does |
|------|-------------|
| `rclone-onedrive.service` | systemd user service for auto-mounting OneDrive |

---

## Setup

### 1. Install dependencies

**Arch Linux**
```bash
sudo pacman -S rclone fuse3
```

**Ubuntu / Debian**
```bash
sudo apt install rclone fuse3
```

**Fedora**
```bash
sudo dnf install rclone fuse3
```

---

### 2. Configure rclone for OneDrive

```bash
rclone config
```

Follow the prompts:
1. `n` — new remote
2. Name it `onedrive`
3. Choose `onedrive` from the provider list
4. Follow the OAuth flow (opens a browser to sign in)
5. Choose account type (personal or business)

Verify it works:
```bash
rclone ls onedrive:
```

---

### 3. Create the mount point

```bash
mkdir ~/OneDrive
```

---

### 4. Install the systemd service

```bash
mkdir -p ~/.config/systemd/user
cp rclone-onedrive.service ~/.config/systemd/user/
systemctl --user enable --now rclone-onedrive.service
```

Your OneDrive is now mounted at `~/OneDrive` and will auto-mount on every login.

---

## Managing the mount

| Command | Action |
|---------|--------|
| `systemctl --user status rclone-onedrive` | Check if mounted |
| `systemctl --user restart rclone-onedrive` | Remount |
| `systemctl --user stop rclone-onedrive` | Unmount |

---

## Why rclone mount over a sync daemon?

The alternative is [abraunegg/onedrive](https://github.com/abraunegg/onedrive), which downloads a full local copy of all your files. rclone mount is better if:

- **Disk space matters** — files only hit disk when you open them (cached up to 5GB)
- **You're mostly online** — no offline access to files you haven't opened recently
- **You use multiple clouds** — rclone supports 70+ providers with the same setup

---

*Built for Arch Linux*
