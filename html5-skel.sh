#!/usr/bin/env /bin/sh

BASE_DIR=$( cd $(dirname $(readlink $0)) ; pwd -P )
TEMPLATES_DIR="$BASE_DIR/templates"
TEMPLATE=$1

die() { echo "$*"; exit 1; } 1>&2

if [ -z "$TEMPLATE" ]; then
    die "ERROR: The template file name must be specified."
fi

TEMPLATE_FILE="$TEMPLATES_DIR/$TEMPLATE.html"

if [ ! -f $TEMPLATE_FILE ]; then
    die "ERROR: Cannot find the template specified '$TEMPLATE' in '$TEMPLATE_FILE' directory."
fi

shift

TITLE=$@

if [ -z "$TITLE" ]; then
    TITLE="html 5 minimal skeleton"
fi

sed 's/${TITLE}/'"$TITLE"'/g' $TEMPLATE_FILE > "$TEMPLATE.html"
