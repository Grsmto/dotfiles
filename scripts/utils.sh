#!/bin/bash
#============================================================================
# Title: Utils
# Usage: source ${DOTFILES_DIR}/scripts/utils.sh
#
# Description:
# Use this at the top of your scripts to utilize colors, formatting and
# logging
#============================================================================

# Colors
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export MAGENTA=$(tput setaf 5)
export CYAN=$(tput setaf 6)
export WHITE=$(tput setaf 7)
export RESET=$(tput sgr0)

# Decorators
export BOLD='\033[1m'
export NORMAL='\033[2m'

log() {
	# If we are running in the foreground, set formatting
	case $(ps -o stat= -p $$) in
	*+*) printf "$1" "$2" ;;
	# Otherwise just log!
	*) echo "$2" ;;
	esac
}

alt() {
	log "${MAGENTA}%s${RESET}\n" "$@"
}

info() {
	echo
	log "${BLUE}${BOLD}%s:${NORMAL}${RESET} \n" "$@"
}

warn() {
	log "${YELLOW}⚠ Warning:${RESET} %s!\n" "$@"
}

error() {
	log "${RED}⊘ Error:${RESET} %s!\n" "$@"
}

confirm() {
	printf "\n"
	log "\n${YELLOW}==> %s${RESET} " "$@"
	read -p "Continue? (y/n) " -n 1 -r
	printf "\n"
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi
}

option() {
	printf "${MAGENTA}%-14s${RESET} %-30s\n" "$1" "$2"
}

prompt() {
	log "${YELLOW}%s:${RESET} " "$@"
}

process_title() {
	log "${MAGENTA}┃ %s${RESET}\n" "$@"
}

process() {
	log "${MAGENTA}┃${RESET} %s...\n" "$@"
}

success() {
	log "${GREEN}✓ Success:${RESET} %s\n" "$@"
}