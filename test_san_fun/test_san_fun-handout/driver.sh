#!/bin/bash
# driver.sh - The simplest autograder we could think of. It checks
#   that students can write a C program that compiles, and then
#   executes with an exit status of zero.
#   Usage: ./driver.sh
# Initialize total score
total_score_1=0
total_score_2=0
max_score=20
test_count_1=0
test_count_2=0
# Compile the code
cd prob_1
echo "Compiling prob_1, hello.c"
(make clean; make)
status1=$?
if [${status1} -ne 0] ; then
    echo "Failure: Unable to compile hello.c (return status = ${status1})"
    total_score_1=0
else 
    # Run the code for problem 1, test cases
    run_test_1() {
        local input1="$1"
        local input2="$2"
        local expected_output="$3"
        local points="$4"
        
        # Increment test count
        test_count_1=$((test_count_1 + 1))
        
        # Provide the inputs to the program and capture the output
        output=$(echo -e "$input1\n$input2" | ./hello)
        
        # Remove any trailing newline from the output
        output=$(echo "$output" | tr -d '\n')
        
        # Print the inputs and the output
        echo "Test $test_count_1"
        echo "Input 1: \"$input1\""
        echo "Input 2: \"$input2\""
        echo "Expected Output: $expected_output"
        echo "Actual Output: $output"
        
        # Check if the output matches the expected output
        if [ "$output" == "$expected_output" ]; then
            echo "Result: PASS for prob_1, test case $input1 $input2"
            total_score_1=$((total_score_1 + points))
        else
            echo "Result: FAIL for prob_1, test case $input1 $input2"
        fi
        echo "-------------------------"
    }

    # Test cases with expected outputs and points
    run_test_1 "hello" "world" "Both strings have the same length." 2
    run_test_1 "test" "testing" "Strings have different lengths." 2
    run_test_1 "same length" "same length" "Both strings have the same length." 2
    run_test_1 "12345" "54321" "Both strings have the same length." 2
    run_test_1 "abcd" "efghij" "Strings have different lengths." 2
fi
# test cases
# Function to run the program with given input and expected output for problem 1



cd ../prob_2
echo "Compiling problem_2, hello.c"
(make clean; make)
status2=$?
if  [${status2} -ne 0] ; then
    echo "Failure: Unable to compile hello.c (return status = ${status2})"
    total_score_2=0
else 
    # Function to run the program with given input and expected output for problem 2
    run_test_2() {
        local input1="$1"
        local input2="$2"
        local expected_output="$3"
        local points="$4"
        
        # Increment test count
        test_count_2=$((test_count_2 + 1))
        
        # Provide the inputs to the program and capture the output
        output=$(echo -e "$input1\n$input2" | ./hello)
        
        # Remove any trailing newline from the output
        output=$(echo "$output" | tr -d '\n')
        
        # Print the inputs and the output
        echo "Test $test_count_2"
        echo "Input 1: \"$input1\""
        echo "Input 2: \"$input2\""
        echo "Expected Output: $expected_output"
        echo "Actual Output: $output"
        
        # Check if the output matches the expected output
        if [ "$output" == "$expected_output" ]; then
            echo "Result: PASS for prob_2, test case $input1 $input2"
            total_score_2=$((total_score_2 + points))
        else
            echo "Result: FAIL for prob_2, test case $input1 $input2"
        fi
        echo "-------------------------"
    }
    # Test cases with expected outputs and points
    run_test_2 "hello" "world" "Both strings have the same length." 2
    run_test_2 "test" "testing" "Strings have different lengths." 2
    run_test_2 "same length" "same length" "Both strings have the same length." 2
    run_test_2 "12345" "54321" "Both strings have the same length." 2
    run_test_2 "abcd" "efghij" "Strings have different lengths." 2
fi



total_score=$((total_score_1 + total_score_2))
# Calculate percentage score
percentage=$((total_score * 100 / max_score))

# Print the total score
echo "Total Score: $total_score / $max_score"
echo "Percentage: $percentage%"

echo "Success: ./prob_1, ./prob_2 runs with an exit status of 0 for test case-0"
echo "{\"scores\": {\"Prob_1\": $total_score_1, \"Prob_2\": $total_score_2}, "scoreboard": [$total_score_1, $total_score_1, $total_score] }" # "Prob1": 10, "Prob2": 5

# Run the code
# echo "Running ./hello, ./hello"
# ./prob_1
# ./prob_2
# status=$?
# if [ ${status} -eq 0 ]; then
#     echo "Success: ./prob_1, ./prob_2 runs with an exit status of 0 for test case-0"
#     echo "{\"scores\": {\"Prob_1\": $total_score_1, \"Prob_2\": $total_score_2}, , "scoreboard": [$total_score_1, $total_score_1, $total_score] }" # "Prob1": 10, "Prob2": 5
# else
#     echo "Failure: ./prob_1, prob_2 fails or returns nonzero exit status of ${status}"
#     echo "{\"scores\": {\"Prob_1\": 0, \"Prob_2\": 0}, "scoreboard": [0, 0, 0] }"
# fi

exit
