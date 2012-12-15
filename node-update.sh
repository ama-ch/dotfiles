#!/bin/sh
# Update latest stable version, use it and migrate npm packages.

PREV_VER=$(nodebrew ls|grep current:|cut -d ' ' -f 2)
echo "Current version: $PREV_VER"
echo ""
echo "nodebrew install-binary stable"
nodebrew install-binary stable
if [ $? -ne 0 ]; then
    # Already installed 
    exit 1
fi

echo ""
echo "nodebrew use stable"
nodebrew use stable

echo ""
if [ "$PREV_VER" = "none" ]; then
    echo '"nodebrew migrate-package" is skipped.'
    exit 1
fi
echo "nodebrew migrate-package $PREV_VER"
nodebrew migrate-package $PREV_VER
