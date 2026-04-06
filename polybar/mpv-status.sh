#!/bin/bash

SOCKET="/tmp/mpvsocket"

if [ -S "$SOCKET" ]; then
    TITLE=$(echo '{ "command": ["get_property", "media-title"] }' | socat - $SOCKET 2>/dev/null | jq -r '.data')

    if [ "$TITLE" != "null" ] && [ -n "$TITLE" ]; then
        # Limit to 30 characters
        SHORT_TITLE="${TITLE:0:30}"

        # Add "..." if trimmed
        if [ ${#TITLE} -gt 30 ]; then
            SHORT_TITLE="${SHORT_TITLE}..."
        fi

        echo "  $SHORT_TITLE"
    else
        echo ""
    fi
else
    echo ""
fi
