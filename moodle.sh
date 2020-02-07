#!/bin/sh
rm -rf moodle public

hugo
cp -r public moodle
cd moodle
for folder in `find . -mindepth 1 -type d`
do
cd $folder
cp index.html ../$folder.html
sed -i 's/\/\"/\.html"/g' ../$folder.html
sed -i 's/"\.\.\//"\.\//g' ../$folder.html
cd ..
rm -rf $folder
done

sed -i 's/\/\"/\.html"/g' index.html
sed -i 's/"\.\.\//"\.\//g' ../$folder.html
cd ..
