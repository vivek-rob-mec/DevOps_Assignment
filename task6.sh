PACKAGE_FILE="packages.txt"
LOG_FILE="install_packages.txt"

> "$LOG_FILE"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Read each line (package name) and install
while read -r package; do
  # Skip empty lines and comments
  [[ -z "$package" || "$package" == \#* ]] && continue

  echo "Installing $package..."
  if apt-get install -y "$package" >> "$LOG_FILE" 2>&1; then
    echo "$package: SUCCESS" >> "$LOG_FILE"
  else
    echo "$package: FAILED" >> "$LOG_FILE"
  fi
done < "$PACKAGE_FILE"

echo "Installation complete. Check $LOG_FILE for details."

