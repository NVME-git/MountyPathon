#!/usr/bin/env python3
"""
MountyPathon - OneDrive mount manager
"""

import os
import sys
import subprocess

SERVICE = "rclone-onedrive"
MOUNT   = os.path.expanduser("~/OneDrive")
CACHE   = os.path.expanduser("~/.cache/rclone/vfs")


def run(args, timeout=None):
    return subprocess.run(args, capture_output=True, text=True, timeout=timeout)


def get_status():
    r = run(["systemctl", "--user", "is-active", SERVICE])
    service_status = r.stdout.strip()
    if service_status == "active":
        mounted = os.path.ismount(MOUNT)
        return f"active ({'mounted' if mounted else 'mount unresponsive'})"
    return service_status


def service_action(action):
    r = run(["systemctl", "--user", action, SERVICE])
    if r.stderr:
        print(r.stderr.strip(), file=sys.stderr)
    sys.exit(r.returncode)


def cache_size():
    if not os.path.exists(CACHE):
        return "0 (no cache)"
    r = run(["du", "-sh", CACHE])
    return r.stdout.split()[0] if r.stdout else "unknown"


def doctor():
    svc = run(["systemctl", "--user", "is-active", SERVICE]).stdout.strip()
    mounted = os.path.ismount(MOUNT)
    print(f"  service  : {svc}")
    print(f"  mount    : {'ok' if mounted else 'not mounted'} ({MOUNT})")
    print(f"  cache    : {cache_size()} ({CACHE})")
    if mounted:
        try:
            r = run(["rclone", "lsd", "onedrive:"], timeout=10)
            print(f"  remote   : {'reachable' if r.returncode == 0 else 'unreachable'}")
        except subprocess.TimeoutExpired:
            print("  remote   : unreachable (timeout)")


def show_logs():
    subprocess.run(["journalctl", "--user", "-u", SERVICE, "-f"])


def reauth():
    subprocess.run(["rclone", "config", "reconnect", "onedrive:"])


ACTIONS = {
    "status":  lambda: print(get_status()),
    "start":   lambda: service_action("start"),
    "stop":    lambda: service_action("stop"),
    "restart": lambda: service_action("restart"),
    "logs":    show_logs,
    "doctor":  doctor,
    "reauth":  reauth,
}

if __name__ == "__main__":
    if len(sys.argv) < 2 or sys.argv[1] not in ACTIONS:
        print(f"Usage: mountypathon [{'|'.join(ACTIONS)}]")
        sys.exit(1)
    ACTIONS[sys.argv[1]]()
