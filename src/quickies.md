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

LEN=$(echo `expr "$FOO" : '[A-Z][a-z]*'`)
LASTNAME=$(echo ${FOO:0:LEN})
YEAR=$(echo ${FOO:LEN})


cat ../../../resources/references.raw.txt | awk -F, '{if (NF == 1) {print $0} else {split($1, a, " "); print a[1],a[2];{for (i = 2; i <= NF; i++) print a[1] $i}  }}' | sort | uniq

comm -23 references.sorted.txt references.false_positives.txt  | egrep -v 'K[0-9]+' > references.true_positives.txt

cat resources/references.raw.txt | sed -n '/K1/,/K2/p' | grep --word-regexp --file resources/references.true_positives.txt

cat resources/references.raw.txt | sed -n '/K11/,/$/p' | grep --word-regexp --file resources/references.true_positives.txt

sed -i  -e 's/\[.*\]//g' -e 's/\[.*)//g' -e 's/\s\{2,\}/ /g' -e 's/^[a-z]$//g' -e 's/g$//' -e '/^$/d' resources/reverse_references.txt