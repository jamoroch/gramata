All entries in Herausgeberband with quotes
cut -f 2,3 -d: data.txt  | nl | grep '^[0-9]*[ \t][^A-Z]*„'

Moegliche Zeitschriften with quotes
cut -f 2,3 -d: data.txt  | nl | grep '^[0-9]*[ \t][^A-Z]*„' | grep -v Hg

catch  quote mark period misplacement
cut -f 2,3 -d: data.txt  | nl | grep  '^[0-9]*[ \t][^A-Z]*„' | grep -F .“

spot problems at the first colon
cut -f 1 -d: data.txt  | egrep -v ')$'

end part of possible article in publication
nl resources/data.txt | grep "In:" | awk -F "In:" '{print $(NF)}'

check  begin of page end of page
cat resources/data.txt | grep "In:" | awk -F "In:" '{print $(NF)}' | egrep -o '[0-9]{1,}-[0-9]{1,}' | awk -F- '{print $2 - $1}'