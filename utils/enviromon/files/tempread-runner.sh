#!/bin/sh

set -ex
device=/dev/i2c-1

bindir=$(dirname $(readlink -f $0))
wwwdir=/www
dir=/tmp/run/tempread
file="${dir}/current"

if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    if [ ! -d "$dir" ]; then
        echo "$dir is not a directory" >&2
        exit 1
    fi
fi

if [ ! -e "${wwwdir}/tempread" ]; then
    ln -s "$dir" "${wwwdir}/tempread"
fi

umask 0022
for type in txt json graphite prometheus; do
    tmpfile=$(mktemp -p "$dir" new.XXXXXX)
    trap "rm -f "$tmpfile"" EXIT
    "${bindir}/tempread" "$type" "$device" > "$tmpfile"
    chmod go+r "$tmpfile"
    mv "$tmpfile" "$file.$type"
    trap "" EXIT
done
