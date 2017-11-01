#include <sys/syscall.h>
#include <unistd.h>

#define msg_stdout "output to stdout\n"
#define msg_stderr "output to stderr\n"

int __attribute__((__weak__))
asm_syscall(int nr, ...) {
	(void)nr;
	return 0;
}

int __attribute__((__weak__))
asm_fork(void) 
{
	return asm_syscall(__NR_fork);
}

int __attribute__((__weak__))
asm_write(int fd, const char *buf, size_t count) 
{
	return asm_syscall(__NR_write, fd, buf, count);
}

void __attribute__((__weak__))
asm_exit(int status) 
{
	asm_syscall(__NR_exit, status);
}

void test_asm(void)
{
}

int 
main(void)
{
	int rc;
	rc = asm_write(STDOUT_FILENO, msg_stdout, sizeof(msg_stdout));
	if (rc < 0)
		asm_exit(-1);

	asm_fork();
	if (rc < 0)
		asm_exit(-1);

	asm_write(STDERR_FILENO, msg_stderr, sizeof(msg_stderr));
	if (rc < 0)
		asm_exit(-1);

	asm_exit(0);
}
