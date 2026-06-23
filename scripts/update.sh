#!/bin/sh

# This script is used to update one or more Grav components (core, skeleton, plugins, themes) to the latest version.
# Usage: Usage: ./scripts/update.sh <... components>

cd "$(dirname "$0")/.." || exit 1
grav_root=$(pwd)

usage() {
    echo "Usage: ./scripts/update.sh <... components>"
    echo "Components: core, skeleton, plugins, themes"
    exit 1
}

# Check if component is set
if [ $# -eq 0 ]; then
    usage
fi

update_core() {
    cd "$grav_root" || exit 1
    git pull
}
update_skeleton() {
    cd "$grav_root/user" || exit 1
    git pull
}
update_plugins() {
    cd "$grav_root" || exit 1
    bin/gpm update --plugins --no-interaction
}
update_themes() {
    cd "$grav_root" || exit 1
    bin/gpm update --themes --no-interaction
}

# Actions for each component
for component in "$@"; do
    case "$component" in
        core)
            echo "Updating Grav core..."
            update_core
            ;;
        skeleton)
            echo "Updating Grav skeleton..."
            update_skeleton
            ;;
        plugins)
            echo "Updating Grav plugins..."
            update_plugins
            ;;
        themes)
            echo "Updating Grav themes..."
            update_themes
            ;;
        *)
            echo "Invalid component: $component"
            usage
            ;;
    esac
done
