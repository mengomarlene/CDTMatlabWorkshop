for filename in *.csv
do
words=`wc -l $filename | awk '{print $1}'`

if [ $words -lt 60 ]
then
  mv $filename short
else
  mv $filename long
fi

done