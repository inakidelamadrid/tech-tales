#!/bin/bash

# Colors for better readability
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

VERSION_FILE="version.txt"

# Create version file if it doesn't exist
if [ ! -f "$VERSION_FILE" ]; then
  echo "0.0.0" > "$VERSION_FILE"
  echo -e "${BLUE}Initialized version file with 0.0.0${NC}"
fi

# Get current version
CURRENT_VERSION=$(cat "$VERSION_FILE")
echo -e "${BLUE}Current version: ${YELLOW}v$CURRENT_VERSION${NC}"

# Parse the current version
IFS='.' read -r -a VERSION_PARTS <<< "$CURRENT_VERSION"
MAJOR=${VERSION_PARTS[0]}
MINOR=${VERSION_PARTS[1]}
PATCH=${VERSION_PARTS[2]}

# Ask for version bump type
echo -e "${BLUE}Select version bump type:${NC}"
echo "1) Major (x.0.0)"
echo "2) Minor (0.x.0)"
echo "3) Patch (0.0.x)"
echo "4) Custom version"

read -p "Enter choice [1-4]: " BUMP_TYPE

# Determine new version
case $BUMP_TYPE in
  1)
    NEW_VERSION="$((MAJOR + 1)).0.0"
    ;;
  2)
    NEW_VERSION="$MAJOR.$((MINOR + 1)).0"
    ;;
  3)
    NEW_VERSION="$MAJOR.$MINOR.$((PATCH + 1))"
    ;;
  4)
    read -p "Enter custom version (x.y.z format): " NEW_VERSION
    if ! [[ $NEW_VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      echo -e "${YELLOW}Invalid version format. Should be x.y.z (numbers only).${NC}"
      exit 1
    fi
    ;;
  *)
    echo -e "${YELLOW}Invalid choice. Exiting.${NC}"
    exit 1
    ;;
esac

# Ask for release notes
echo -e "${BLUE}Enter release notes (end with an empty line):${NC}"
RELEASE_NOTES=""
while IFS= read -r line; do
  [[ -z "$line" ]] && break
  RELEASE_NOTES+="$line"$'\n'
done

# Confirm with user
echo -e "${YELLOW}New version will be: v$NEW_VERSION${NC}"
echo -e "${YELLOW}Release notes:${NC}"
echo "$RELEASE_NOTES"
read -p "Proceed? (y/n): " CONFIRM

if [[ $CONFIRM != "y" && $CONFIRM != "Y" ]]; then
  echo -e "${YELLOW}Release cancelled.${NC}"
  exit 0
fi

# Save the new version to version.txt
echo "$NEW_VERSION" > "$VERSION_FILE"

# Commit the version file
git add "$VERSION_FILE"
git commit -m "Bump version to v$NEW_VERSION"

# Create tag with release notes
echo "$RELEASE_NOTES" | git tag -a "v$NEW_VERSION" -F -

# Push commit and tag
echo -e "${BLUE}Pushing commit and tag...${NC}"
git push origin HEAD
git push origin "v$NEW_VERSION"

# Create and checkout new branch
NEW_BRANCH="dev-v$NEW_VERSION"
echo -e "${BLUE}Creating new branch: $NEW_BRANCH${NC}"
git checkout -b "$NEW_BRANCH"
git push -u origin "$NEW_BRANCH"

echo -e "${GREEN}✅ Release v$NEW_VERSION completed!${NC}"
echo -e "${GREEN}✅ Now working on branch: $NEW_BRANCH${NC}"
