#!/usr/bin/env bash

# # TODO: add the descriptions to the types (legend / descriptions)

# legend from linux-sxs.org/housekeeping/lscolors.html
read -r legend << EOT
di = directory
fi = file
ln = symbolic link
pi = fifo file
so = socket file
bd = block (buffered) special file
cd = character (unbuffered) special file
or = symbolic link pointing to a non-existent file (orphan)
mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
ex = file which is executable (ie. has 'x' set in permissions).
EOT

tabs 15

echo 'Color listing for file display (from $LS_COLOR)'
echo -e "Item\tSample"
echo ""

IFS=":" read -r -a array <<< $LS_COLORS
for element in "${array[@]}" 
do
IFS="=" read -r -a thisline <<< $element
  for index in "${!thisline[@]}"
  do
  if [[ $index -eq 1 ]]; then
    echo -e "$element\t\e[${thisline[index]]}mLooks like this!\e[0m"
  fi
  done
done
