#!/bin/sh

# --- Configuration ---
GHOSTTY_THEME_DIR="$HOME/.config/ghostty/themes"
GHOSTTY_THEME_NAME="pywal-theme"
PYWAL_CACHE_DIR="$HOME/.cache/wal"
PYWAL_COLORS_FILE="$PYWAL_CACHE_DIR/colors.json"

# --- Helper Functions ---
# Function to convert hex color (e.g., #RRGGBB) to Ghostty's expected format (e.g., RRGGBB)
# This function will be used for colors that do NOT have the '#' prefix in Ghostty.
remove_hex_prefix() {
  echo "$1" | sed 's/^#//'
}

# --- Main Script ---

# Check if colors.json exists
if [ ! -f "$PYWAL_COLORS_FILE" ]; then
  echo "Error: $PYWAL_COLORS_FILE not found. Pywal might have failed." >&2
  exit 1
fi

# 2. Extract colors using jq
echo "Extracting colors from $PYWAL_COLORS_FILE..."

# Special colors
PYWAL_BACKGROUND=$(jq -r '.special.background' "$PYWAL_COLORS_FILE")
PYWAL_FOREGROUND=$(jq -r '.special.foreground' "$PYWAL_COLORS_FILE")
PYWAL_CURSOR=$(jq -r '.special.cursor' "$PYWAL_COLORS_FILE")

# For selection-background, we'll try to use Pywal's color8 (bright black)
# You can adjust this if you want it to map to a different Pywal color.
PYWAL_COLOR8=$(jq -r '.colors.color8' "$PYWAL_COLORS_FILE")

# 3. Create the Ghostty theme content
THEME_CONTENT=""

# Main colors (without '#' prefix)
THEME_CONTENT="${THEME_CONTENT}background = $(remove_hex_prefix "$PYWAL_BACKGROUND")\n"
THEME_CONTENT="${THEME_CONTENT}foreground = $(remove_hex_prefix "$PYWAL_FOREGROUND")\n"
THEME_CONTENT="${THEME_CONTENT}cursor-color = $(remove_hex_prefix "$PYWAL_CURSOR")\n"
# Assume cursor-text is same as foreground, and remove prefix
THEME_CONTENT="${THEME_CONTENT}cursor-text = $(remove_hex_prefix "$PYWAL_FOREGROUND")\n"
# Selection colors (using your specified logic and removing prefix)
THEME_CONTENT="${THEME_CONTENT}selection-background = $(remove_hex_prefix "$PYWAL_COLOR8")\n" # Using color8 as per your example #626880
THEME_CONTENT="${THEME_CONTENT}selection-foreground = $(remove_hex_prefix "$PYWAL_FOREGROUND")\n"

# Add ANSI Palette colors (color0 to color15)
# These colors need to RETAIN the '#' prefix based on your example.
for i in $(seq 0 15); do
  COLOR_HEX=$(jq -r ".colors.color${i}" "$PYWAL_COLORS_FILE")
  # No need to call remove_hex_prefix here, as you want the '#' to remain.
  THEME_CONTENT="${THEME_CONTENT}palette = ${i}=${COLOR_HEX}\n"
done

# 4. Ensure theme directory exists
mkdir -p "$GHOSTTY_THEME_DIR"

# 5. Write the theme file
THEME_PATH="$GHOSTTY_THEME_DIR/$GHOSTTY_THEME_NAME"
printf "%b" "$THEME_CONTENT" >"$THEME_PATH"

echo "Ghostty theme generated at: $THEME_PATH"
echo "Remember to set 'theme = pywal-theme' in your main Ghostty config and reload (Ctrl+Shift+,) or restart Ghostty."
