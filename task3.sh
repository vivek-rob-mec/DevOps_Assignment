USER_FILE="user_list.txt"
CRED_FILE="credentials.txt"

> "$CRED_FILE"

while read username; do
	[ -z "$username" ] && continue

	password=$(openssl rand -base64 8)

	sudo useradd -m "$username"
	echo "$username:$password" | sudo chpasswd

	echo "$username:$password" >> "$CRED_FILE"

done < "$USER_FILE"

echo "User created successfully and credential saved."
