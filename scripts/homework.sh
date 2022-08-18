#!/bin/bash

mkdir ~/task
for output in $(getent group | awk -F: '{ print $1}')
do
    mkdir ~/task/$output
    chown root:$output ~/task/$output
    chmod 607 ~/task/$output
    chmod g+s ~/task/$output
    chmod o+t ~/task/$output
done

echo "Hard and soft link" > ./test.txt

ln ./test.txt test_hard_link.txt
ln -s ./test.txt test_soft_link.txt

mkdir ~/archive

for item in {1..5}
do
    touch ./archive/$item
done

tar -cvf ./archive.tar ./archive
gzip ./archive.tar
