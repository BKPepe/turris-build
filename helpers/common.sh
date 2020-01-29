# Common functions for turris-build scripts
# (C) 2019-2020 CZ.NIC, z.s.p.o.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Common printing functions ############
_color_echo() {
	local name="$1"
	local color="$2"
	local text="$3"
	shift 2
	if [ -t 2 ] || [ -n "$IS_TTY" ]; then
		echo -e "\033[${color}m${text}"'\033[0m' >&2
	else
		echo "$name: $text" >&2
	fi
}

# Intended for stage progression reporting
report() {
	_color_echo 'REPORT' '0;34' "$*"
}

# To report non-fatal failures and warning
warn() {
	_color_echo 'WARNING' '0;31' "$*"
}

# This is to report hints and less important notes
note() {
	_color_echo 'NOTE' '0;37' "$*"
}

# Call this to report a fatal error and exit script
die() {
	_color_echo 'ERROR' '0;31' "$*"
	exit 1
}
