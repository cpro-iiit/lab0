#!/bin/bash

##### Evaluating P1
cd p1
echo "Compiling p1 main.c"
(make clean; make)
status=$?
# if not able to compile score for p1 is 0
if [ ${status} -ne 0 ]; then
    echo "Failure: Unable to compile main.c (return status = ${status})"
    score_1=0
else 
    echo "Running p1 ./main"
    ./main
    status=$?
    # if compiled and exit 0 then score for p1 is 10
    if [ ${status} -eq 0 ]; then
        echo "Success: ./main runs with an exit status of 0"
        score_1=10
    else
    # if compiled and exit nonzero, then score for p1 is 5
        echo "Failure: ./main fails or returns nonzero exit status of ${status}"
        score_1=5
    fi
fi


##### Evaluating P2
cd ../p2
echo "Compiling p2 main.c"
(make clean; make)
status=$?
# if not able to compile score for p2 is 0
if [ ${status} -ne 0 ]; then
    echo "Failure: Unable to compile main.c (return status = ${status})"
    score_2=0
else 
    echo "Running p2 ./main"
    ./main
    status=$?
    # if compiled and exit 0 then score for p2 is 10
    if [ ${status} -eq 0 ]; then
        echo "Success: ./main runs with an exit status of 0"
        score_2=10
    else
    # if compiled and exit nonzero, then score for p2 is 5
        echo "Failure: ./main fails or returns nonzero exit status of ${status}"
        score_2=5
    fi
fi

##### Outputing Scores
echo "{\"scores\": {\"p1\": $score_1, \"p2\": $score_2}, "scoreboard": [$score_1, $score_2, $score_1+$score_2] }"
exit

