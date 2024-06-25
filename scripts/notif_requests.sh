#!/bin/bash

# Base URL of your API
BASE_URL="http://localhost:3000/notifications"

# Function to send a notification
sendNotification() {
  message=$1
  userId=$2

  # check if message and recipient are provided
  if [ -z "$message" ] || [ -z "$userId" ]; then
    echo "Usage: sendNotification [message] [userId]"
    exit 1
  fi

  # Create JSON payload
  payload=$(cat <<EOF
{
  "message": "$message",
  "userId": "$userId"
}
EOF
)

  # Make POST request to send notification
  response=$(curl -s -X POST -H "Content-Type: application/json" -d "$payload" "$BASE_URL/send")
  echo "Response: $response"
}

# Main function to handle command line arguments
main() {
  case $1 in
    sendNotification)
      sendNotification $2 $3
      ;;
    *)
      echo "Usage: $0 {sendNotification} [message] [userId]"
      ;;
  esac
}

# Call the main function with all script arguments
main "$@"
