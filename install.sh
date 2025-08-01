#!/usr/bin/env bash

dot_files=(dotfiles/*)
error_occured=false
config_folder="${XDG_CONFIG_HOME:-$HOME/.config}"
symlinks_file="created-symlinks.txt"

declare -A created_symlinks

func_print_error() {
    echo -e "\033[0;31mERROR\033[0m: $1"
    error_occured=true
}

func_create_symlinks() {
    local current_dot_folder="$1"
    local current_config_folder="$2"

    local dot_files=("$current_dot_folder"/*)
    local dot_file=""

    for dot_file in ${dot_files[@]}; do

        local config_file="$current_config_folder/${dot_file##*/}"

        # Special case when the file exists but is a symbolic link to a non-existent folder and file.
        # In such a case [ -e $config_file ] returns false.
        if [ -L "$config_file" ]; then
            local existing_symlink="$(readlink -f "$config_file")"
            local RESULT=$?

            if [ $RESULT -ne 0 ]; then
                func_print_error "Symlink $config_file already exists and points to non-existent file."
                continue
            fi

            if [ "$existing_symlink" != "$dot_file" ]; then
                func_print_error "Symlink $config_file already exists and points to a wrong file."
                continue
            fi
            continue
        elif [ -f "$config_file" ]; then
            func_print_error "Cannot create symlink. $config_file already exists and it is a regular file."
            continue
        elif [ -d "$config_file" ]; then
            func_create_symlinks "$dot_file" "$config_file"
            continue
        elif [ -e "$config_file" ]; then
            func_print_error "Cannot create symlink. $config_file already exists."
            continue
        fi

        ln -s "$dot_file" "$config_file"
        created_symlinks["$config_file"]=1
    done
}

func_save_symlinks() {
    echo -n "" > "$symlinks_file"
    for created_symlink in "${!created_symlinks[@]}"; do
        echo "$created_symlink" >> "$symlinks_file"
    done
}

func_load_symlinks() {
    if ! [ -e "$symlinks_file" ]; then
        return
    fi

    while read line; do
        created_symlinks["$line"]=1
    done < "$symlinks_file"
}

func_load_symlinks
func_create_symlinks "$(pwd)/dotfiles" "$config_folder"
func_save_symlinks

if [ $error_occured == true ]; then
    echo -e "\033[0;31mErrors occured during installation.\033[0m"
else
    echo -e "\033[0;32mSuccessfully installed!\033[0m"
fi

