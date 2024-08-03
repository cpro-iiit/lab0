#
# Makefile to manage the example Demo_Lab_01 Lab
# this will take the directory name and create a Demo_Lab_01-handout directory, autograder autograde.tar, and Demo_Lab_01-handout.tar

# Get the name of the lab directory
LAB = $(notdir $(PWD))

all: handout handout-tarfile  # Build the handout and handout-tarfile targets, if you run ```$ make```, it will run these two targets

handout: 
	# Rebuild the handout directory that students download
	(rm -rf $(LAB)-handout; mkdir $(LAB)-handout)           # Remove the old handout directory and create a new handout directory
	mkdir $(LAB)-handout/prob_1                             # Create a new directory called prob_1
	mkdir $(LAB)-handout/prob_2                             # Create a new directory called prob_2
	cp -p src/Makefile-handout $(LAB)-handout/Makefile      # Copy the Makefile-handout file to the Makefile file in the handout directory
	cp -p src/README-handout $(LAB)-handout/README          # Copy the README-handout file to the README file in the handout directory
	cp -p src/prob_1/hello.c-handout $(LAB)-handout/prob_1/hello.c  # Copy the hello.c-handout file to the hello.c file in the prob_1 directory in the handout directory
	cp -p src/prob_2/hello.c-handout $(LAB)-handout/prob_2/hello.c  # Copy the hello.c-handout file to the hello.c file in the prob_2 directory in the handout directory
	cp -p src/prob_1/Makefile $(LAB)-handout/prob_1/Makefile # Copy the Makefile file in the prob_1 directory to the Makefile file in the prob_1 directory in the handout directory
	cp -p src/prob_2/Makefile $(LAB)-handout/prob_2/Makefile # Copy the Makefile file in the prob_2 directory to the Makefile file in the prob_2 directory in the handout directory
	cp -p src/driver.sh $(LAB)-handout 					     # Copy the driver.sh file to the handout directory

handout-tarfile: handout
	# Build *-handout.tar and autograde.tar
	tar cvf $(LAB)-handout.tar $(LAB)-handout
	cp -p $(LAB)-handout.tar autograde.tar

clean: # Clean the entire lab directory tree if ```$ make clean``` is run
	# Clean the entire lab directory tree.  Note that you can run
	# "make clean; make" at any time while the lab is live with no
	# adverse effects.
	rm -f *~ *.tar
	(cd src; make clean)
	(cd test-autograder; make clean)
	rm -rf $(LAB)-handout
	rm -f autograde.tar
#
# CAREFULL!!! This will delete all student records in the logfile and
# in the handin directory. Don't run this once the lab has started.
# Use it to clean the directory when you are starting a new version
# of the lab from scratch, or when you are debugging the lab prior
# to releasing it to the students.
#
cleanallfiles:
	# Reset the lab from scratch.
	make clean
	rm -f log.txt
	rm -rf handin/*

