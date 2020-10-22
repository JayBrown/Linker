#!/bin/zsh

# Linker Finder QuickAction
# version 1.0.0

export LANG=en_US.UTF-8
export PATH=/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/opt/local/bin:/opt/sw/bin:/sw/bin:$HOME/.local/bin:$HOME/local/bin:$HOME/bin:$HOME/Developer/bin

if ! command -v linker &>/dev/null ; then
	account=$(id -u)
	osascript &>/dev/null << EOT
beep
tell application "System Events"
	display notification "Linker main script not found!" with title "Linker [" & "$account" & "]" subtitle "❌ Error: \$PATH"
end tell
EOT
	exit
fi

linker "$@" &
exit
