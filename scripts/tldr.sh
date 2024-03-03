#!/bin/bash

tldr() {
	tldr_sub_options=(" Common" " Linux")
	selected_sub_option=$(printf "%s\n" "${tldr_sub_options[@]}" | rofi "${rofi_args[@]}" -p "")

	search() {
		prompt() {
			rofi -dmenu -no-config -i -no-fixed-num-lines -mesg 'Name of command. e.g. go build' -p "" -theme ./rofi/prompt.rasi &
		}
		search_prompt=$(prompt &)
		search_prompt=$(echo "$search_prompt" | tr ' ' '-')

		xdg-open "https://tldr.inbrowser.app/pages/$1/${search_prompt}"
	}

	# Handle the selected sub-option or go back to the main menu
	case $selected_sub_option in
	" Common")
		search 'common'
		;;
	" Linux")
		search 'linux'
		;;
	*)
		show_menu # Go back to the main menu
		;;
	esac
}
