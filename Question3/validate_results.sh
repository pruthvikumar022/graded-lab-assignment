#!/bin/bash

PASS_ALL=0
FAIL_ONE=0

echo "Students who failed in exactly ONE subject:"

while IFS=',' read -r roll name m1 m2 m3
do
    fail_count=0

    if [ "$m1" -lt 33 ]; then
        fail_count=$((fail_count + 1))
    fi
    if [ "$m2" -lt 33 ]; then
        fail_count=$((fail_count + 1))
    fi
    if [ "$m3" -lt 33 ]; then
        fail_count=$((fail_count + 1))
    fi

    if [ "$fail_count" -eq 1 ]; then
        echo "$roll - $name"
        FAIL_ONE=$((FAIL_ONE + 1))
    fi

    if [ "$fail_count" -eq 0 ]; then
        PASS_ALL=$((PASS_ALL + 1))
    fi

done < marks.txt

echo
echo "Students who passed in ALL subjects:"
while IFS=',' read -r roll name m1 m2 m3
do
    if [ "$m1" -ge 33 ] && [ "$m2" -ge 33 ] && [ "$m3" -ge 33 ]; then
        echo "$roll - $name"
    fi
done < marks.txt

echo
echo "Count of students who failed in exactly ONE subject: $FAIL_ONE"
echo "Count of students who passed in ALL subjects: $PASS_ALL"
