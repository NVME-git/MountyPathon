# MountyPathon

> *"It's only a model (filesystem)."*

OneDrive on Linux via rclone virtual filesystem — no sync daemon, no files sitting on disk.

[![Buy Me a Coffee](https://img.shields.io/badge/Buy_Me_a_Coffee-support-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/nabeelvandayar)

---

## Why This Exists

Microsoft doesn't make an official OneDrive client for Linux. MountyPathon fills that gap using **rclone mount** to expose OneDrive as a virtual filesystem at `~/OneDrive`. Files appear instantly and download on demand. A systemd user service keeps it mounted automatically on login.

---

## Contents

| File | What it does |
|------|-------------|
| `mountypathon.bash` | Shell function for managing the OneDrive mount |
| `rclone-onedrive.service` | systemd user service for auto-mounting |

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
rclone lsd onedrive:
```

---

### 3. Install the systemd service

```bash
mkdir -p ~/.config/systemd/user
cp rclone-onedrive.service ~/.config/systemd/user/
systemctl --user enable --now rclone-onedrive.service
```

---

### 5. Install MountyPathon

Add the shell function to your shell config:

**Option A — source the file** (replace `/path/to` with the actual directory):

```bash
echo 'source /path/to/mountypathon.bash' >> ~/.bashrc   # or ~/.zshrc
source ~/.bashrc
```

**Option B — paste directly** into your `~/.bashrc` / `~/.zshrc` and run `source ~/.bashrc`.

---

## Usage

```bash
mountypathon status    # check if mounted
mountypathon start     # mount
mountypathon stop      # unmount
mountypathon restart   # remount
mountypathon logs      # tail the rclone journal (live follow)
mountypathon doctor    # service state, mount health, cache size, remote reachability
mountypathon reauth    # reconnect OneDrive OAuth (token expired or revoked)
```

> **Why Bash?** A shell function in your `.bashrc`/`.zshrc` is the sweet spot — simpler than a script file, no installation needed, no `chmod`, no `~/.local/bin` path setup. `&&`/`||` gives actual success/failure feedback, and `status` checks both the service and the mount point (they can disagree after a crash).

---

## Why rclone mount over a sync daemon?

The alternative is [abraunegg/onedrive](https://github.com/abraunegg/onedrive), which downloads a full local copy of all your files. rclone mount is better if:

- **Disk space matters** — files only hit disk when you open them (cached up to 5GB)
- **You're mostly online** — no offline access to files you haven't opened recently
- **You use multiple clouds** — rclone supports 70+ providers with the same tool

> **Disclaimer:** MountyPathon may occasionally claim to be "not dead yet" even when the WiFi is down. It has been known to argue that a 5GB cache is merely a flesh wound.

---

## Setup Assistant

[![Gemini Setup Assistant](https://img.shields.io/badge/Gemini-Setup_Assistant-4285F4?style=for-the-badge&logo=google-gemini&logoColor=white)](https://gemini.google.com/share/77086f713388)

> *Based on a snapshot of this repo. For the most up-to-date instructions, always refer to the text in this README.*

Or copy and paste this prompt into [Gemini](https://gemini.google.com):

```
I am setting up MountyPathon on Linux — a tool that mounts OneDrive as a virtual
filesystem using rclone and systemd.

Repo: https://github.com/NVME-git/MountyPathon

I want your help with the following:

1. Walk me through running `rclone config` to set up an OneDrive remote named
   "onedrive", including the OAuth flow and how to verify it worked.

2. Explain what each flag in the systemd service does in plain English:
   --vfs-cache-mode full, --vfs-cache-max-size, --dir-cache-time,
   --poll-interval, --vfs-read-chunk-size, --buffer-size, --attr-timeout

3. Help me debug these specific errors if I hit them:
   - "transport endpoint is not connected"
   - "directory not empty" on unmount
   - mount shows active but files are inaccessible

4. Explain the security model honestly: what is and isn't encrypted, where my
   OAuth token is stored, and what the local VFS cache means for my data.

Start by asking me which Linux distro I'm on so you can tailor the commands.
```

---

## FAQ

**What role does FUSE play?**

Normally filesystems are implemented in the kernel. FUSE (Filesystem in Userspace) lets rclone act as a filesystem driver without kernel code or root access. When you `ls ~/OneDrive`, the kernel forwards the request to rclone via FUSE, rclone fetches from OneDrive, and returns the result — all as your normal user. That's why `fusermount3` is used to unmount rather than a standard `umount`.

**Is my data encrypted in transit?**

Yes. rclone communicates with OneDrive over HTTPS (TLS) — the same as any browser accessing OneDrive.

**Is my data encrypted at rest?**

Not by default. Two places data lands on disk:

- `~/.config/rclone/rclone.conf` — stores your OAuth token in plaintext. rclone sets permissions to `600` automatically, but anyone with access to your user account can read it.
- `~/.cache/rclone/` — the VFS cache (`--vfs-cache-mode full`). Files you open are cached here unencrypted, up to 5GB.

If someone gets local access to your Linux user account, both the OneDrive credentials and cached files are readable.

---

## Troubleshooting

**`transport endpoint is not connected`**

The rclone process died but the FUSE mount point is still registered. Force-unmount and restart:

```bash
fusermount3 -uz ~/OneDrive
systemctl --user restart rclone-onedrive
```

**`directory not empty` on unmount**

Same root cause — stale FUSE mount. The `-z` flag (lazy unmount) clears it:

```bash
fusermount3 -uz ~/OneDrive
```

**Mount shows as `active` but files aren't accessible**

`mountypathon status` will report `active (mount unresponsive)` if the service is running but the filesystem isn't responding. Restart the service:

```bash
mountypathon restart
```

**Checking rclone logs**

The service logs to the system journal via syslog:

```bash
journalctl --user -u rclone-onedrive -f
```

---

## Roadmap

- [ ] Encrypt `rclone.conf` credentials using rclone's `--password-command` option — set `RCLONE_CONFIG_PASS` in the service's `Environment=` line to prompt for a passphrase at mount time instead of storing the OAuth token in plaintext.

---

*Built on Linux*
