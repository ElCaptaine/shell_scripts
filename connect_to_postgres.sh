#!/bin/zsh

# Function to connect to a specified database by name
connect_to_database() {
  # Check if .db.conf file exists
  if [ ! -f .db.conf ]; then
    echo "The .db.conf file was not found in the current directory."
    return 1
  fi

  # Read available databases from .db.conf and store them in an array
  available_databases=($(awk -F '[][]' '/\[.*\]/ {print $2}' .db.conf))

  if [ -z "$available_databases" ]; then
    echo "No databases found in .db.conf. Exiting."
    return 1
  fi

  echo "Available Databases: ${available_databases[@]}"

  # Use fzf for interactive selection
  selected_database=$(echo "${available_databases[@]}" | tr ' ' '\n' | fzf)

  if [ -z "$selected_database" ]; then
    echo "No database selected. Exiting."
    return 1
  fi

  # Read credentials for the selected database into variables
  process_lines=false
  while IFS= read -r line; do
    case "$line" in
      "[$selected_database]") process_lines=true ;;
      "")
        process_lines=false
        ;;
      *)
        if [ "$process_lines" = true ]; then
          while IFS== read -r key value; do
            case "$key" in
              host) host=$(echo "$value" | awk '{gsub(/^ +| +$/,"")}1') ;;
              port) port=$value ;;
              user) user=$value ;;
              password) password=$value ;;
            esac
          done <<< "$line"
        fi
        ;;
    esac
  done < .db.conf

  # Connect to PostgreSQL using psql with credentials
  PGPASSWORD="$password" psql -h "$host" -p "$port" -U "$user" -d "postgres"
}

# Call the function to connect to the specified database
connect_to_database

