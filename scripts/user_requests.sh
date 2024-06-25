#!/bin/bash

# Base URL of your API
BASE_URL="http://localhost:3000/users"

# Function to create a user
createUser() {
  username=$1
  email=$2

  # check if username and email are provided
  if [ -z "$username" ] || [ -z "$email" ]; then
    echo "Usage: createUser <username> <email>"
    exit 1
  fi

  # Create JSON payload
  payload=$(cat <<EOF
{
  "username": "$username",
  "email": "$email"
}
EOF
)

  # Make POST request to create user
  response=$(curl -s -X POST -H "Content-Type: application/json" -d "$payload" "$BASE_URL/create")
  echo "Response: $response"
}

# Function to get user notifications by ID
getUserNotifications() {
  id=$1

  # check if user ID is provided
  if [ -z "$id" ]; then
    echo "Usage: getUserNotifications <id>"
    exit 1
  fi

  # Make GET request to get user notifications
  response=$(curl -s -X GET "$BASE_URL/$id/notifications")
  echo "Response: $response"
}

# Main function to handle command line arguments
main() {
  case $1 in
    createUser)
      createUser $2 $3
      ;;
    getUserNotifications)
      getUserNotifications $2
      ;;
    *)
      echo "Usage: $0 {createUser|getUserNotifications} [arguments]"
      ;;
  esac
}

# Call the main function with all script arguments
main "$@"
