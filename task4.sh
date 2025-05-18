read -p "Enter directory path to created backup of: " dir

if [ ! -d "$dir" ]; then
	echo "No directory exist"
	exit 1
fi

FILENAME=$(basename "$dir")
TIMESTAMP=$(date +"%Y%m%d_%H%M%s")
backup_file="${FILENAME}_backup_$TIMESTAMP.tar.gz"

tar -czf "$backup_file" "$dir"

echo "Backup completed: $backup_file"

