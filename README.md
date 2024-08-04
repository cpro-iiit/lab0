# Autolab Assesment Template
This is a minimal template for autolab assesments having multiple problems. TAs can clone this repo and make changes to files described bellow:

1. `l0.rb`: Replace `LabZero` with CamelCased assesment name and `lab0` with small cased assesment name.
2. `l0.yml`: Replace `l0` with `li` for the ith lab and `ai` for the ith assignment, `pi` for the ith practice assesment. Change the category name to be Lab, Assignment, Practice, Exam. If there are more problems, add more by copy pasting the corresponding lines from previous problem subtree.
3. `writeup/l0.html`: Replace with problem description in plain english with some example test cases.
4. `src/pi/*`: there are seperate directories for each problem `pi` (for i=1,2,3..), which should have the problem solution in `src/pi/main.c` and its Makefile at `src/pi/Makefile`. `src/pi/main.c-handout` contains the file that will be put in the student handout instead of `src/pi/main.c`.
5. `src/driver-handout.sh`: shell script with public test cases that will be part of the student handout. Need to modify this with the problems public test cases.
6. `src/driver.sh`: shell script with private test cases that will be run at the server. Need to modify this with the problems private test cases. Students should not be seeing this file.
7. `src/Makefile`: Makefile for the entire assesment. This default one, runs make recursively on the problem directories. It is run as part of the student handout as well as used by the autograding server. We could make another version of this which is private/public, if your problem needs seperate Makefiles for student/server. In that case, this file will be run at the server side and another one `src/Makefile-handout` need to be created which will be part of the student handout.
8. `Makefile`: This make file is used by TA/autolab to generate `l0-handout.tar` which is the student handout and `autograde.tar` which has all the private files/test cases needed for autograding. It basically ensures that respective files are in the handout or the autograde tar as described in 3-7. For more complicated assesments, you might need to tweak this.
9. `autograde-Makefile`: Student handins will be graded using this Makefile. The system will copy the `handin.tar` that student uploads and `autograde.tar` that was created by Makefile in 8, into a folder along with this file renamed as `Makefile`. Then it runs make. The last line of the output of this make command is a json that will be used to populate the scores for each of the problems. 

In all the files, identifiers like `l0` needs to be appropriately changed. Once some filenames are changed, the Makefiles refering to them also needs to be appropriately changed. Once you are done making changes and testing things, run `make clean`, go one level up in directory and use `tar cvf l0.tar lab0` to make a tar file which can be upoaded at Install Assesment, option 3 in the autolab website (pingala.iiit.ac.in).


Please create some assessments, install them in autolab and test it as a student with directions provided here (https://cpro-iiit.github.io/docs/course_material/labs/0/).

