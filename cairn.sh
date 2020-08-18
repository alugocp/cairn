#!/bin/bash

#######################################################################
##
## Copyright (C) 2020 LugoCorp, LLC
## Contact: http://lugocorp.net
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU Lesser General Public License as
## published by the Free Software Foundation, either version 3 of
## the License, or (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program. If not, see <http://www.gnu.org/licenses/>.
##
#######################################################################

if [ "$#" -lt 2 ]; then
	echo "Usage: cairn <src> <dst>"
	printf "  src - the project directory to be built\n"
	printf "  dst - the build destination\n"
	exit 1
fi
in="$1"
out="$2"
[ "${out:0:1}" != "/" ] && out="$(pwd)/${out}"
[ "${in:0:1}" != "/" ] && in="$(pwd)/${in}"
mkdir -p "$out"

pushd "$in" > /dev/null
files=( $(find *) )

for f in "${files[@]}"; do
  if [ -f "$f" ]; then
    folder=$(dirname "$f")
    file=$(basename "$f")
    ext="${file##*.}"
    if [ "$ext" == "php" ]; then
      if [ "$file" == "index.php" ]; then
        [ "$folder" != "." ] && mkdir -p "$out/$folder"
        pushd "$folder" > /dev/null
        php index.php > "$out/$folder/index.html"
        popd > /dev/null
      fi
    else
      [ "$folder" != "." ] && mkdir -p "$out/$folder"
      cp "$folder/$file" "$out/$folder/$file"
    fi
  fi
done
popd > /dev/null
