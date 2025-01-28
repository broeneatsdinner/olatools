#for file in .bash_*; do [ -f "$file" ] && . "$file"; done
for file in .*; do
    [ -f "$file" ] && . "$file"
done
