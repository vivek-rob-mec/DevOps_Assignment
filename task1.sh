backup_dir="$HOME/backup"

mkdir -p "$backup_dir"

timestamp=$(date +"%Y%m%d_%H%M%S") 

for file in *.txt;
do
	if [[ -f "$file" ]]; then
		filename=$(basename "$file" .txt)
		cp "$file" "$backup_dir/${filename}_$timestamp.txt"
	fi
done

echo "File backedup successfully to : $backup_dir"
