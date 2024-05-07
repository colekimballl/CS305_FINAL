# Define the compiler to use and the flags to pass for compilation
CC = cc
CFLAGS = -Wall  # Enable all warnings

# Define the default target that gets built when you run 'make' without arguments
all: main.out

# Target to create main.out by running the main program and capturing its output
main.out: main
	./main | tee main.out  # Execute main and write the output to both console and main.out

# Link the object files into the final executable named 'main'
main: main.o get_student_id.o
	$(CC) $(CFLAGS) -o main main.o get_student_id.o  # Linking step with flags

# Compile main.c to produce main.o; also depends on get_student_id.h
main.o: main.c get_student_id.h
	$(CC) $(CFLAGS) -c main.c  # Compilation step for main.c

# Compile get_student_id.c to produce get_student_id.o; also depends on get_student_id.h
get_student_id.o: get_student_id.c get_student_id.h
	$(CC) $(CFLAGS) -c get_student_id.c  # Compilation step for get_student_id.c

# Clean target to remove compiled files and clean up the directory
clean:
	rm -f main main.out *.o  # Remove executable, output file, and all object files
