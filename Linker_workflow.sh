#!/bin/zsh
# shellcheck shell=bash

# Linker Finder workflow (QuickAction or Service)
# version 1.0.1

export LANG=en_US.UTF-8
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/local/bin:/opt/sw/bin:/sw/bin:"$HOME"/.local/bin:"$HOME"/local/bin:"$HOME"/bin:"$HOME"/Developer/bin

if ! command -v linker &>/dev/null ; then
	xattr -c /usr/local/bin/linker 2>/dev/null
	xattr -c /opt/local/bin/linker 2>/dev/null
	xattr -c /opt/sw/bin/linker 2>/dev/null
	xattr -c /sw/bin/linker 2>/dev/null
	xattr -c "$HOME"/.local/bin/linker 2>/dev/null
	xattr -c "$HOME"/local/bin/linker 2>/dev/null
	xattr -c "$HOME"/bin/linker 2>/dev/null
	xattr -c "$HOME"/Developer/bin/linker 2>/dev/null
	chmod +x /usr/local/bin/linker 2>/dev/null
	chmod +x /opt/local/bin/linker 2>/dev/null
	chmod +x /opt/sw/bin/linker 2>/dev/null
	chmod +x /sw/bin/linker 2>/dev/null
	chmod +x "$HOME"/.local/bin/linker 2>/dev/null
	chmod +x "$HOME"/local/bin/linker 2>/dev/null
	chmod +x "$HOME"/bin/linker 2>/dev/null
	chmod +x "$HOME"/Developer/bin/linker 2>/dev/null
	if ! command -v linker &>/dev/null ; then
		account=$(id -u)
		osascript &>/dev/null << EOT
beep
tell application "System Events"
	display notification "Main Linker shell script not found!" with title "Linker QuickAction [" & "$account" & "]" subtitle "❌ Error: \$PATH"
end tell
EOT
		exit
	fi
fi

linker "$@" &
exit
