# This script performs cleaning operations of counrty files with errors

cd data/clean/

# Fix Guinea file - just want middle 12 rows
echo "fixing Guinea file"
head -n 24 Guinea.cc.txt | tail -n12 > Guinea.cc.txt.clean 
mv -v Guinea.cc.txt.clean Guinea.cc.txt

# Fix China file - just want top 12
echo "fixing China file"
head -n12 China.cc.txt> China.cc.txt.clean
mv -v China.cc.txt.clean China.cc.txt

# Fix Niger file - we jsut want the top 12 
echo "fixing Niger file"
head -n12 Niger.cc.txt> Niger.cc.txt.clean
mv -v Niger.cc.txt.clean Niger.cc.txt


cd ../..
sleep 1


