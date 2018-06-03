cd src
for filename in *.gd; do
   cat $filename | sed 's/,/ANTIQUES/g' | sed 's/;/,/g' | m4 | sed 's/ANTIQUES/,/g' > ../$filename
done
cd ..
