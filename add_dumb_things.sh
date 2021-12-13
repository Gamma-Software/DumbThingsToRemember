#!/bin/bash

function update_git_repo() {
    git add . > /dev/null 2>&1
    git commit -m "$1" > /dev/null 2>&1
    git push > /dev/null 2>&1
}

function add_quick_dumb_things() {
    # Ask for the new dumb thing title
    echo -e "\n[Computer] What is the title of the new dumb thing? (Don't forget the '#'!)"
    read -p "[$USER] " title

    # Ask for the new dumb thing description
    echo -e "\n[Computer] What is the description of the new dumb thing?"
    read -p "[$USER] " desc
    
    # Sure to add the dumb thing?
    echo -e "\n[Computer] Are you sure to add your dumb thing? (y/n)\n $title\n $desc"
    read -p "[$USER] " sure
    if [ $sure == "y" ]; then
        # Add the dumb thing
        echo -e "\n[Computer] Adding your dumb thing...\n $title\n $desc"
        echo -e "$title\n$desc" >> README.md
        
        # Update the git repo
        update_git_repo "Added new dumb thing: $title"
    else
        # Add the dumb thing
        echo -e "$title\n$desc" >> README.md

        # And let me edit it in my editor
        echo -e "\n[Computer] Ok, you're so dumb, I let you edit the README.md file manually."
        add_elaborate_dumb_things
    fi
}

function add_elaborate_dumb_things() {
    # Update the README.md file with nano
    # TODO git possibily to open with other editor
    nano README.md &&

    echo -e "\n[Computer] Name the commit"
    read -p "[$USER] " commit_name
    update_git_repo "$commit_name"
}


# switch between the two functions
if [ "$1" == "quick" ]; then
    add_quick_dumb_things
elif [ "$1" == "elaborate" ]; then
    add_elaborate_dumb_things
else
    echo "Usage: add_dumb_things.sh [quick|elaborate]"
fi