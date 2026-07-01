#!/bin/bash

while true
do
    clear
    echo "======================================"
    echo "    Linux User Management Script"
    echo "======================================"
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Check User"
    echo "4. User Information"
    echo "5. Add User to Sudo Group"
    echo "6. Exit"
    echo

    read -p "Enter your choice: " choice

    case $choice in

    1)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            echo "User already exists."
        else
            sudo useradd -m "$username"
            sudo passwd "$username"
            echo "User created successfully."
        fi
        ;;

    2)
        read -p "Enter username to delete: " username

        if id "$username" &>/dev/null
        then
            sudo userdel -r "$username"
            echo "User deleted successfully."
        else
            echo "User not found."
        fi
        ;;

    3)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            echo "User exists."
        else
            echo "User does not exist."
        fi
        ;;

    4)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            id "$username"
        else
            echo "User not found."
        fi
        ;;

    5)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            sudo usermod -aG sudo "$username"
            echo "User added to sudo group."
        else
            echo "User not found."
        fi
        ;;

    6)
        echo "Exiting..."
        exit
        ;;

    *)
        echo "Invalid choice."
        ;;
    esac

    echo
    read -p "Press Enter to continue..."
done