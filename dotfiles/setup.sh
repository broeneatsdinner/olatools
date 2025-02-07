
# Run this script with:
# source setup.sh
# When your prompt changes, you know it ran correctly

# Ensure script is sourced, not executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script must be sourced. Use: source setup.sh"
    return 1 2>/dev/null || exit 1
fi

# Set default values for variables to avoid unbound errors
export COLORTERM=${COLORTERM:-""}

# Source all dotfiles safely
for file in .*; do
    if [ -f "$file" ]; then
        echo "Sourcing: $file"
        source "$file" || echo "Error sourcing $file"
    fi
done
