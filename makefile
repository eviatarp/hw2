# Defined veriables CC, CCLINK, CFLAGS, and OBJS
CC=gcc # Compiler
CCLINK=$(CC) # Read variable CC using $(CC)
CFLAGS=-g -Wall -std=c99 # Flag rules
OBJS=file0.o file1.o file2.o file3.o file4.o main.o 


prog.exe: $(OBJS)
	$(CCLINK) $(OBJS) -o prog.exe

# Full rule syntax
# File0 is dependent on file1 and file3
file0.o:	file0.c 	file0.h 	file1.h 	file3.h

# File1 is dependent on file4
file1.o: 	file1.c 	file1.h 	file4.h

# File2 is dependent on file3 
file2.o: 	file2.c 	file2.h 	file3.h

# File3 is dependent on file0 and file2
file3.o: 	file3.c 	file3.h 	file0.h 	file2.h

# File4 is dependent on file3 and file0
file4.o: 	file4.c 	file4.h 	file3.h 	file0.h

# Main is dependent on file0 and file1 and file2 and file3 and file4
main.o: 	main.c 		file0.h 	file1.h 	file2.h 	file3.h 	file4.h


# Gets rid of objects and executable files
clean:
	rm -rf *.o *.exe