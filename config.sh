#!/bin/bash

# Set the path to your configuration file
config_file="${HOME}/.config/relight/relightconf"

# Function to parse the configuration file
parse_config() {
	local section=""
	while IFS= read -r line || [[ -n "$line" ]]; do
		# Skip comments and empty lines
		if [[ $line =~ ^\s*# || $line =~ ^\s*$ ]]; then
			continue
		fi

		# Check if the line represents a section
		if [[ $line =~ ^\[(.*)\]$ ]]; then
			section="${BASH_REMATCH[1]}"
			continue
		fi

		# Check if the line has an equal sign (key-value pair) or not
		if [[ $line =~ = ]]; then
			# Split the line into key and value
			key=$(echo "$line" | cut -d'=' -f1 | tr -d '[:space:]')
			value=$(echo "$line" | cut -d'=' -f2- | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

			# If the key is "single", treat it as an array
			if [[ "$key" == "single" ]]; then
				eval "${section}_${key}+=('$value')"
			else
				# Set the variable with the section prefix dynamically
				eval "${section}_${key}=\"$value\""
			fi
		else
			# For single values, set the variable directly
			eval "${section}_single+=('$line')"
		fi
	done <"$config_file"
}

# Call the function to parse the configuration file
parse_config

# Check if each variable exists and set default values if not
if ! declare -p theme_name &>/dev/null; then
	theme_name="default"
fi

if ! declare -p theme_dark &>/dev/null; then
	theme_dark=false
fi

if ! declare -p extensions_single &>/dev/null; then
	extensions=("calc" "emoji" "tldr")
else
	extensions=("${extensions_single[@]}")
fi
