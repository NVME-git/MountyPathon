# 🚀 Hyprland Window & Workspace Management Guide

A beginner-friendly guide to mastering window and workspace movement in Hyprland.

---

## 🎯 Quick Start: The Core Concepts

Think of your setup in layers:
1. **Windows** - Individual applications
2. **Workspaces** - Collections of windows (like virtual desktops)
3. **Monitors** - Physical screens

You can move windows between workspaces, and move entire workspaces between monitors!

---

## 🧠 The Intuitive Key Pattern

All movement commands start with `Super` key, then add modifiers based on what you want to do:

```
Super                    = Basic navigation
Super + Shift            = Move or manipulate windows
Super + Alt              = Move windows between workspaces
Super + Alt + Shift      = Move windows AND follow them
Super + Ctrl             = Move entire workspaces
```

---

## 📊 Visual Cheat Sheet

### Moving Within the Current Workspace

```
┌─────────────────────────────────────┐
│  Window A  │  Window B  │  Window C │
└─────────────────────────────────────┘

Super + Arrow Keys
→ Move focus between windows (just look at them)

Super + Shift + Arrow Keys
→ Swap window positions (rearrange them)
```

**Keys:**
- `Super + ←/→/↑/↓` - Focus different windows
- `Super + Shift + ←/→/↑/↓` - Swap window positions

---

### Moving Windows Between Workspaces

```
Workspace 1          Workspace 2          Workspace 3
┌──────────┐        ┌──────────┐        ┌──────────┐
│ Window A │   →    │          │        │          │
└──────────┘        └──────────┘        └──────────┘
```

**Keys:**
- `Super + Alt + →` - Move active window to next workspace (you stay here)
- `Super + Alt + ←` - Move active window to previous workspace (you stay here)

**With Follow (move yourself too):**
- `Super + Alt + Shift + →` - Move window to next workspace AND go there
- `Super + Alt + Shift + ←` - Move window to previous workspace AND go there

**To Specific Workspace:**
- `Super + Shift + [1-0]` - Send window to workspace 1-10

---

### Moving Entire Workspaces Between Monitors

```
Monitor 1 (HDMI)           Monitor 2 (Laptop)
┌──────────────────┐       ┌──────────────────┐
│   Workspace 1    │  ───→ │   Workspace 2    │
│  • Window A      │       │  • Window X      │
│  • Window B      │       │  • Window Y      │
└──────────────────┘       └──────────────────┘
```

**Keys:**
- `Super + Ctrl + ←` - Move current workspace to left monitor
- `Super + Ctrl + →` - Move current workspace to right monitor
- `Super + Ctrl + ↑` - Move current workspace to upper monitor
- `Super + Ctrl + ↓` - Move current workspace to lower monitor

**💡 Tip:** This moves ALL windows in the workspace together!

**⚠️ Note:** If you have workspaces bound to specific monitors (using `wsbind` in Hyprland config), these shortcuts won't move the workspace itself, but you can still move individual windows between workspaces using `Super + Shift + [number]`.

---

## 🎓 Learning Path: Practice in Order

### Day 1: Basic Navigation
1. `Super + Tab` - Switch between workspaces
2. `Super + [1-9]` - Jump to specific workspace
3. `Super + Arrow Keys` - Move focus between windows

### Day 2: Window Management
4. `Super + Shift + [1-9]` - Send window to specific workspace
5. `Super + Alt + →/←` - Move window to next/previous workspace

### Day 3: Advanced Movement
6. `Super + Alt + Shift + →/←` - Move window and follow it
7. `Super + Ctrl + →/←` - Move entire workspace between monitors

---

## 🎮 Common Workflows

### Workflow 1: Reorganizing Your Setup
**Scenario:** You have too many windows on workspace 1

1. Focus the window you want to move: `Super + Arrow Keys`
2. Send it to next workspace: `Super + Alt + →`
3. Repeat for other windows

### Workflow 2: Moving Your Work to the Big Screen
**Scenario:** You were working on laptop, now want to use external monitor

1. Make sure you're on the workspace you want to move: `Super + [number]`
2. Move entire workspace to other monitor: `Super + Ctrl + →` or `Super + Ctrl + ←`
3. All your windows move together!

### Workflow 3: Quick Window Shuffle
**Scenario:** Need to quickly move a window and continue working with it

1. Focus the window: `Super + Arrow Keys`
2. Move and follow: `Super + Alt + Shift + →`
3. You're now on the new workspace with your window!

### Workflow 4: Deep Focus Mode
**Scenario:** Move distracting apps away but keep them running

1. Focus the distracting window: `Super + Arrow Keys`
2. Send it away: `Super + Alt + →` (or `Super + Shift + 9` for workspace 9)
3. You stay focused on current workspace!

---

## 📝 Complete Keybinding Reference

### Navigation (Just Looking)
| Key | Action |
|-----|--------|
| `Super + Arrow Keys` | Focus different window |
| `Super + [1-0]` | Switch to workspace 1-10 |
| `Super + Tab` | Next workspace |
| `Super + Shift + Tab` | Previous workspace |

### Window Movement
| Key | Action |
|-----|--------|
| `Super + Shift + ←/→/↑/↓` | Swap window positions |
| `Super + Shift + [1-0]` | Move window to workspace 1-10 |
| `Super + Alt + →` | Move window to next workspace |
| `Super + Alt + ←` | Move window to previous workspace |
| `Super + Alt + Shift + →` | Move window to next workspace + follow |
| `Super + Alt + Shift + ←` | Move window to previous workspace + follow |

### Workspace Movement
| Key | Action |
|-----|--------|
| `Super + Ctrl + ←` | Move workspace to left monitor |
| `Super + Ctrl + →` | Move workspace to right monitor |
| `Super + Ctrl + ↑` | Move workspace to upper monitor |
| `Super + Ctrl + ↓` | Move workspace to lower monitor |

### Other Useful Keys
| Key | Action |
|-----|--------|
| `Super + W` | Close active window |
| `Super + V` | Toggle floating mode |
| `Super + J` | Toggle split direction |
| `Alt + Tab` | Cycle through windows |

---

## 🎯 Memory Tricks

### The "Shift" Rule
- **Shift** = You're making a change (moving, swapping, manipulating)
- No Shift = Just looking/navigating

### The "Alt" Pattern
- **Alt** = Alternative workspace (move between workspaces)
- **Alt + Shift** = Alternative workspace + I'm coming too!

### The "Ctrl" Signal  
- **Ctrl** = Control the whole workspace (not just one window)

### The Arrow Logic
- **Arrows alone** = Navigate/focus
- **Arrows + modifiers** = Move things

---

## 🧪 Practice Exercises

### Exercise 1: Window Relay Race
1. Open 3 terminal windows on workspace 1
2. Move first terminal to workspace 2: `Super + Alt + →`
3. Switch to workspace 2: `Super + Tab`
4. Move it to workspace 3: `Super + Alt + →`
5. Bring it back to workspace 1: `Super + Shift + 1`

### Exercise 2: Workspace Ping Pong
1. Open some windows on workspace 1
2. Move entire workspace to other monitor: `Super + Ctrl + →`
3. Move it back: `Super + Ctrl + ←`
4. Practice until it feels natural!

### Exercise 3: The Follow Dance
1. Open a browser on workspace 1
2. Move it to workspace 2 and follow: `Super + Alt + Shift + →`
3. Notice you're now on workspace 2
4. Go back: `Super + Shift + Tab`
5. Now try moving WITHOUT following: `Super + Alt + →`
6. Notice you stayed on workspace 1

---

## 🚨 Common Mistakes

### ❌ "I moved a window but can't find it!"
**Solution:** Press `Super + Tab` to cycle through workspaces, or use `Super + [1-9]` to check each workspace.

### ❌ "I wanted to move the workspace but moved the window instead"
**Solution:** Remember: `Ctrl` = whole workspace, `Alt` = just window

### ❌ "The window went to next workspace but I wanted workspace 5"
**Solution:** Use `Super + Shift + 5` for specific workspace numbers

### ❌ "I pressed the keys but nothing happened"
**Solution:** Make sure the window is focused first (click on it or use `Super + Arrow Keys`)

---

## 💡 Pro Tips

1. **Start with specific numbers:** When learning, use `Super + Shift + [number]` to move windows to specific workspaces. It's more predictable.

2. **Name your workspaces mentally:** Think "workspace 1 = coding, workspace 2 = browser, workspace 3 = communication" - makes navigation easier.

3. **Use the "follow" shortcut:** When you need to move a window AND work on it, `Super + Alt + Shift + →` saves you two steps!

4. **Monitor names matter:** Your setup has:
   - `eDP-1` = Laptop screen
   - `HDMI-A-1` = External monitor (on the left)
   
   Use `Super + Ctrl + ←` to move to HDMI, `Super + Ctrl + →` to move to laptop.

5. **Muscle memory drill:** Spend 5 minutes daily just moving windows around. It'll become second nature in a week!

---

## 🎓 Next Level: Advanced Techniques

Once comfortable with the basics:

1. **Batch moving:** Quickly reorganize by moving multiple windows in succession using `Super + Alt + →` repeatedly
2. **Workspace hopping:** Use `Super + Tab` and `Super + Shift + Tab` to navigate while moving windows
3. **Monitor workflows:** Dedicate one monitor to coding workspaces (1-5) and another to communication (6-10)

---

## 🎨 Waybar Workspace Display Configuration

Your Waybar is configured to show workspace numbers **only on the monitor they're bound to**. This means:

- **Each monitor's Waybar** shows only the workspaces that are permanently assigned to that monitor
- **HDMI-A-1 (left monitor)** displays workspaces 1-5
- **eDP-1 (laptop screen)** displays workspaces 6-10
- This keeps your setup clean and organized with dedicated workspaces per monitor

**How it works:**
The configuration requires TWO components to work together:

1. **Hyprland workspace bindings** (in `~/.config/hypr/monitors.conf`):
   ```
   wsbind = 1, HDMI-A-1
   wsbind = 2, HDMI-A-1
   wsbind = 3, HDMI-A-1
   wsbind = 4, HDMI-A-1
   wsbind = 5, HDMI-A-1
   
   wsbind = 6, eDP-1
   wsbind = 7, eDP-1
   wsbind = 8, eDP-1
   wsbind = 9, eDP-1
   wsbind = 10, eDP-1
   ```

2. **Waybar configuration** (in `~/.config/waybar/config.jsonc`):
   ```json
   "hyprland/workspaces": {
     "all-outputs": false,
     ...
   }
   ```

**What you'll see:**
```
Monitor 1 (HDMI-A-1)        Monitor 2 (eDP-1)
Waybar: [1] [2] [3] [4] [5] Waybar: [6] [7] [8] [9] [10]
```

**Important Notes:**
- Workspaces are now **permanently bound** to their monitors
- You cannot move workspaces between monitors with `Super + Ctrl + →/←` when using `wsbind`
- Instead, move windows between workspaces across monitors using workspace numbers
- To change workspace assignments, edit `~/.config/hypr/monitors.conf` and reload: `hyprctl reload`

**Customization:**
- To change which workspaces belong to which monitor, edit the `wsbind` lines in `~/.config/hypr/monitors.conf`
- To show all workspaces on all monitors again: Change `"all-outputs": false` to `"all-outputs": true` in Waybar config and remove `wsbind` lines from Hyprland config
- Reload: `hyprctl reload && pkill waybar && waybar &`

---

## 📚 Additional Resources

- Official Hyprland Wiki: https://wiki.hyprland.org/
- Waybar Wiki: https://github.com/Alexays/Waybar/wiki
- Your Hyprland config: `~/.config/hypr/bindings.conf`
- Your Waybar config: `~/.config/waybar/config.jsonc`
- Test Hyprland changes: `hyprctl reload`
- Restart Waybar: `pkill waybar && waybar &`

---

## ✅ Quick Reference Card (Print This!)

```
╔══════════════════════════════════════════════════════════╗
║         HYPRLAND WINDOW/WORKSPACE QUICK REFERENCE        ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║  FOCUS/NAVIGATE                                          ║
║  Super + Arrows        → Focus window                    ║
║  Super + [1-0]         → Switch workspace                ║
║  Super + Tab           → Next workspace                  ║
║                                                          ║
║  MOVE WINDOWS                                            ║
║  Super + Alt + →/←     → Move window next/prev workspace ║
║  Super + Alt + Shift + →/← → Move + follow              ║
║  Super + Shift + [1-0] → Move to specific workspace     ║
║                                                          ║
║  MOVE WORKSPACES                                         ║
║  Super + Ctrl + →/←    → Move workspace between monitors ║
║                                                          ║
║  OTHER                                                   ║
║  Super + W             → Close window                    ║
║  Alt + Tab             → Cycle windows                   ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
```

---

**Happy window managing! 🎉**

*Last updated: 2024*
*Created for Hyprland on Omarchy*
