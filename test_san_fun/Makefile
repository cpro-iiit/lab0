#
# Makefile to manage the example Test_san_fun Lab
#

# Get the name of the lab directory
LAB = $(notdir $(PWD))

all: handout handout-tarfile

handout: 
	# Rebuild the handout directory that students download
	(rm -rf $(LAB)-handout; mkdir $(LAB)-handout)
	mkdir $(LAB)-handout/prob_1
	mkdir $(LAB)-handout/prob_2
	cp -p src/Makefile-handout $(LAB)-handout/Makefile
	cp -p src/README-handout $(LAB)-handout/README
	cp -p src/prob_1/hello.c-handout $(LAB)-handout/prob_1/hello.c 
	cp -p src/prob_2/hello.c-handout $(LAB)-handout/prob_2/hello.c
	cp -p src/prob_1/Makefile $(LAB)-handout/prob_1/Makefile
	cp -p src/prob_2/Makefile $(LAB)-handout/prob_2/Makefile
	cp -p src/driver.sh $(LAB)-handout

handout-tarfile: handout
	# Build *-handout.tar and autograde.tar
	tar cvf $(LAB)-handout.tar $(LAB)-handout
	cp -p $(LAB)-handout.tar autograde.tar

clean:
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

