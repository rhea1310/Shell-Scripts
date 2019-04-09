#!/bin/bash
list="`ls *.txt`"
c=0
k=""
m=""
for i in $list
do 
    j=(`./getKeyword.sh "$i"`)
    #echo $i: ${x[0]}
    a=(`wc -w "$i"`)
    echo ${a[1]}: ${a[0]} "words"
    echo "Keyword:" ${j[0]}
    echo "`grep \"${j[0]}\" $i | head -n 3`"
    echo
    if [ "$c" -lt "${j[1]}" ]
    then
        c=${j[1]}
        k=${j[0]}
        m=$i
    fi
done
echo "The word is: '$k' in $m"  