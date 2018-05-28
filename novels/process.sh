cd src
for filename in *.gd; do
   m4 $filename > ../$filename
done
cd ..
