#!/bin/sh

MODID=$(grep "^id=" module.prop | cut -d= -f2)
MODVER=$(grep "^version=" module.prop | cut -d= -f2)

DATE=$(date +%Y-%m-%d)
OUTFILE="$MODID-$MODVER-$DATE.zip"

[ -f "$OUTFILE" ] && rm -f "$OUTFILE"

ZIPPER="${1:-${ZIPPER:-zip}}"

"$ZIPPER" -r -9 "$OUTFILE" META-INF module.prop customize.sh sepolicy.rule files

echo "Built: $OUTFILE"
