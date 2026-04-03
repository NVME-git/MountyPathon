#!/bin/bash
# Safe rclone sync script with options

echo "================================================"
echo "     SAFE RCLONE SYNC OPTIONS"
echo "================================================"
echo ""
echo "Dry run?"
echo "1) Yes"
echo "0) No"
echo ""
read -p "Enter choice [0-1]: " dry_run
echo ""
echo "Choose sync method:"
echo ""
echo "1) Bidirectional sync (bisync) - syncs both ways [RECOMMENDED]"
echo "2) Download only (copy --update) - safe one-way, no deletions"
echo "3) Mirror from remote (sync --update) - one-way with safety"
echo "4) Cancel"
echo ""
read -p "Enter choice [1-4]: " choice

case $choice in
    1)
        echo ""
        if [[ $dry_run -eq "1" ]]; then
          echo "Dry running bidirectional sync..."
          rclone bisync onedrive: ~/OneDrive --verbose --progress --track-renames --remove-empty-dirs --exclude='/Personal Vault/**' --dry-run
        else
          echo "Running bidirectional sync..."
          rclone bisync onedrive: ~/OneDrive --verbose --progress --track-renames --remove-empty-dirs --exclude='/Personal Vault/**'
        fi
        ;;
    2)
        echo ""
        if [[ $dry_run -eq "1" ]]; then
          echo "Dry copying newer files from OneDrive (safe)..."
          rclone copy onedrive: ~/OneDrive --update --verbose --progress --exclude='/Personal Vault/**' --dry-run
        else
          echo "Copying newer files from OneDrive (safe)..."
          rclone copy onedrive: ~/OneDrive --update --verbose --progress --exclude='/Personal Vault/**'
        fi
        ;;
    3)
        echo ""
        if [[ $dry_run -eq "1" ]]; then
          echo "Dry syncing from OneDrive (won't overwrite newer local files)..."
          rclone sync onedrive: ~/OneDrive --update --verbose --progress --exclude='/Personal Vault/**' --dry-run
        else
          echo "Syncing from OneDrive (won't overwrite newer local files)..."
          rclone sync onedrive: ~/OneDrive --update --verbose --progress --exclude='/Personal Vault/**'
        fi
        ;;
    4)
        echo "Cancelled."
        exit 0
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac

echo ""
echo "================================================"
echo "Sync complete!"
echo "================================================"
