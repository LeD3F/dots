#!/bin/sh
#
# ufetch-arch - tiny system info for arch

## INFO

# user is already defined
host="$(hostname)"
os='Arch Linux'
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
shell="$(basename ${SHELL})"

if [ -z "${WM}" ]; then
	if [ "${XDG_CURRENT_DESKTOP}" ]; then
		envtype='WM:'
		WM="${XDG_CURRENT_DESKTOP}"
	elif [ "${DESKTOP_SESSION}" ]; then
		envtype='WM:'
		WM="${DESKTOP_SESSION}"
	elif [ -f "${HOME}/.xinitrc" ]; then
		envtype='WM:'
		WM="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
	fi
else
	envtype='WM:'
fi

## DEFINE COLORS

# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

# you can change these
lc="${reset}${bold}${cyan}"		# labels
nc="${reset}${bold}${cyan}"		# user and hostname
ic="${reset}${bold}${white}"		# info
c0="${reset}${bold}${cyan}"		# first color
c1="${reset}${cyan}"			# second color

## OUTPUT

cat <<EOF

${c0}        /\        ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}       /^^\       ${lc}OS:        ${ic}${os}${reset}
${c0}      /\   \      ${lc}KERNEL:    ${ic}${kernel}${reset}
${c0}     /  ${c1}__  \     ${lc}UPTIME:    ${ic}${uptime}${reset}
${c1}    /  (  )  \    ${lc}PACKAGES:  ${ic}${packages}${reset}
${c1}   / __|  |__\\\\   ${lc}SHELL:     ${ic}${shell}${reset}
${c1}  ///        \\\\\  ${lc}${envtype}        ${ic}${WM}${reset}

EOF
