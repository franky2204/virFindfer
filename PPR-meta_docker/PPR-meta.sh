file=$1
output=$(basename "$file" | sed 's/\(.*\)\..*/\1/')_out
cd /home/PPR-Meta
./PPR_Meta "$file" "$output"