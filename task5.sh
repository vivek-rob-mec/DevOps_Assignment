#!/bin/bash

TODO_FILE="$HOME/todo.txt"

touch "$TODO_FILE"

# Display menu
echo "==== Simple To-Do List ===="
echo "1. View Tasks"
echo "2. Add Task"
echo "3. Remove Task"
echo "4. Exit"
echo "==========================="

read -p "Choose an option (1-4): " choice

case $choice in
  1)
    echo
    echo "---- To-Do List ----"
    if [ ! -s "$TODO_FILE" ]; then
      echo "No tasks yet."
    else
      nl -w2 -s'. ' "$TODO_FILE"
    fi
    ;;
  2)
    read -p "Enter your task: " task
    echo "$task" >> "$TODO_FILE"
    echo "Task added."
    ;;
  3)
    echo
    nl -w2 -s'. ' "$TODO_FILE"
    read -p "Enter the task number to remove: " num
    sed -i "${num}d" "$TODO_FILE"
    echo "Task removed."
    ;;
  4)
    echo "Goodbye!"
    ;;
  *)
    echo "Invalid option."
    ;;
esac

