#!/bin/bash

# Description:
# A simple to-do list manager that allows users to add, view, complete, and delete tasks. 
# Tasks are stored in a text file for persistence between sessions.

# Usage:
# ./ToDoList.sh

# File to store tasks
TASK_FILE="tasks.txt"

# Function to display tasks
display_tasks() {
    if [[ ! -s $TASK_FILE ]]; then
        echo "No tasks to show."
    else
        nl -w 2 -s '. ' $TASK_FILE | sed 's/|/ - /'
    fi
}

# Function to save a task
save_task() {
    echo "$1|$2" >> $TASK_FILE
}

# Function to load tasks into an array
load_tasks() {
    TASKS=()
    while IFS= read -r LINE; do
        TASKS+=("$LINE")
    done < $TASK_FILE
}

echo "Welcome to the To-Do List Manager!"

while true; do
    echo -e "\nMenu:"
    echo "1. View tasks"
    echo "2. Add task"
    echo "3. Complete task"
    echo "4. Delete task"
    echo "5. Quit"
    
    read -p "Enter your choice: " CHOICE
    
    case $CHOICE in
        1) display_tasks ;;
        2)
            read -p "Enter task description: " DESCRIPTION
            save_task "$DESCRIPTION" "Not Done"
            ;;
        3)
            load_tasks
            display_tasks
            read -p "Enter task number to complete: " TASK_NUM
            if (( TASK_NUM > 0 && TASK_NUM <= ${#TASKS[@]} )); then
                TASKS[$((TASK_NUM - 1))]=$(echo "${TASKS[$((TASK_NUM - 1))]}" | sed 's/Not Done/Done/')
                printf "%s\n" "${TASKS[@]}" > $TASK_FILE
            else
                echo "Invalid task number."
            fi
            ;;
        4)
            load_tasks
            display_tasks
            read -p "Enter task number to delete: " TASK_NUM
            if (( TASK_NUM > 0 && TASK_NUM <= ${#TASKS[@]} )); then
                unset 'TASKS[$((TASK_NUM - 1))]'
                printf "%s\n" "${TASKS[@]}" > $TASK_FILE
            else
                echo "Invalid task number."
            fi
            ;;
        5) break ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done