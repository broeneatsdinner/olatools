
# Run this script with:
# source setup.sh
# When your prompt changes, you know it ran correctly

for file in .*; do
    if [ -f "$file" ]; then
        echo "Sourcing: $file"
        source "$file"
    fi
done
