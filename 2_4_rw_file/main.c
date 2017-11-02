#include <sys/types.h>
#include <sys/stat.h>

#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


int __attribute__((__weak__))
cat(const char *filename) 
{
	int fd;
	struct stat st;
	char *buf;

	/* Open the file in read-only */
	fd = open(filename, O_RDONLY);
	if (fd < 0) {
		warn("open(\"%s\")", filename);
		exit(errno);
	}
	
	/* Retrieve the size of the file */
	if (fstat(fd, &st) < 0) {
		warn("stat(%d)", fd);
		exit(errno);
	}

	/* Allocate enough memory to store the content */
	buf = malloc(st.st_size);
	if (buf == NULL) {
		warn("malloc(%ld)", st.st_size);
		exit(errno);
	}

	/* Read the file into the previously allocated buffer */
	if (read(fd, buf, st.st_size) != st.st_size) {
		warn("read(%d, %p, %ld)", fd, buf, st.st_size);
		exit(errno);
	}

	/* Write the content of the buffer to standard out */
	if (write(STDIN_FILENO, buf, st.st_size) < 0) {
		warn("write(STDIN_FILENO, %p, %ld)", buf, st.st_size);
		exit(errno);
	}

	/* Done with the memory */
	free(buf);

	/* Be a good user and close the file */
	if (close(fd) < 0) {
		warn("close(%d)", fd);
		exit(errno);
	}	

	return 0;
}

int 
main(const int argc, char const * argv[])
{
	int rv;
	if (argc != 2) {
		errx(EINVAL, "Invalid number of argument");
	}

	rv = cat(argv[1]);
	return rv;
}
