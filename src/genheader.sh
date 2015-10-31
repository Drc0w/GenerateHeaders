#!/bin/sh

AddToHeader () 
{
    echo "/* $1 */" >> $2
    cat $1 | grep "^[int|unsigned|long|void|short|char|struct].*)$" >> $2
    echo "" >> $2
}

if [ $# -lt 2 ]; then
    echo "Usage: ./genheader [CFILES] -o FILE"
    exit 1
fi

FILE=$2
SELECT=0
if [ "$1" != "-o" ]; then
    for i in $@; do
        if [ $SELECT -eq 1 ]; then
            FILE=$i
        fi
        if [ "$i" = "-o" ]; then
            SELECT=1
        fi
    done
fi

MACRO=$(echo "$FILE" | tr "a-z." "A-Z_")
if [ ! -e $FILE ]; then
    echo "#ifndef $MACRO" > $FILE
    echo "#define $MACRO" >> $FILE
    echo "" >> $FILE
else
    CONTENT=$(head -n -1 $FILE)
    echo "$CONTENT" > $FILE
    echo "" >> $FILE
fi

if [ $SELECT -ne 0 ]; then
    for i in $@; do
        if [ "$i" = "-o" ]; then
            break;
        fi
        AddToHeader $i $FILE
    done
else
    for i in $(echo *.c); do
        AddToHeader $i $FILE
    done
fi

TEST=$(tail -1 $FILE)
if [ "$TEST" != "#endif /* $MACRO */" ]; then
    echo "#endif /* $MACRO */" >> $FILE
fi
