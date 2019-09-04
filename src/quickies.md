All entries in Herausgeberband with quotes
cut -f 2,3 -d: data.txt  | nl | grep '^[0-9]*[ \t][^A-Z]*„'

Moegliche Zeitschriften with quotes
cut -f 2,3 -d: data.txt  | nl | grep '^[0-9]*[ \t][^A-Z]*„' | grep -v Hg

catch  quote mark period misplacement
cut -f 2,3 -d: data.txt  | nl | grep  '^[0-9]*[ \t][^A-Z]*„' | grep -F .“

spot problems at the first colon
cut -f 1 -d: data.txt  | egrep -v ')$'