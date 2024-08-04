#
# Makefile to manage the example Hello Lab
#

# Get the name of the lab directory
LAB = $(notdir $(PWD))

all: handout handout-tarfile autograde autograde-tarfile

handout: 
	# Rebuild the handout directory that students download
	(rm -rf $(LAB)-handout; mkdir $(LAB)-handout)
	cp -p src/Makefile $(LAB)-handout/Makefile
	cp -p src/README-handout $(LAB)-handout/README
	# Copy prob 1 handout files
	mkdir $(LAB)-handout/p1
	cp -p src/p1/main.c-handout $(LAB)-handout/p1/main.c
	cp -p src/p1/Makefile $(LAB)-handout/p1/Makefile
	# copy problem 2 handout files 
	mkdir $(LAB)-handout/p2
	cp -p src/p2/main.c-handout $(LAB)-handout/p2/main.c
	cp -p src/p2/Makefile $(LAB)-handout/p2/Makefile 
    # copy handout driver with public test cases
	cp -p src/driver-handout.sh $(LAB)-handout/driver.sh

autograde:
	(rm -rf autograde; mkdir autograde)
    # copy autograding driver with privarte test cases 
	cp src/driver.sh autograde/.

handout-tarfile: handout
	tar cvf $(LAB)-handout.tar $(LAB)-handout

autograde-tarfile: autograde
	tar cvf autograde.tar autograde


clean:
	# Clean the entire lab directory tree.  Note that you can run
	# "make clean; make" at any time while the lab is live with no
	# adverse effects.
	rm -f *~ *.tar
	rm -rf autograde $(LAB)-handout
	(cd src; make clean)

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

