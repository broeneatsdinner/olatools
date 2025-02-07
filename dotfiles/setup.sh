
# Run this script with:
# source setup.sh
# When your prompt changes, you know it ran correctly

# Ensure the script is sourced, not executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script must be sourced. Use: source setup.sh"
    return 1 2>/dev/null || exit 1
fi

# Avoid unbound variable errors
set -a  # Export all variables automatically
export COLORTERM=${COLORTERM:-""}
export PROMPT_COMMAND=${PROMPT_COMMAND:-""}
set +a  # Stop automatic exports

# Source all dotfiles safely
for file in .*; do
    if [ -f "$file" ]; then
        echo "Sourcing: $file"
        if ! source "$file"; then
            echo "Error sourcing $file"
        fi
    fi
done
