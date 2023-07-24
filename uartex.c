#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <pthread.h>

int main(void)
{
	int fd;
	fd=open("/dev/ttyS3",O_RDWR);
	struct termios newtio;
 	
   	memset(&newtio, 0, sizeof(struct termios));
   	newtio.c_cflag = B115200 | CS8 | CLOCAL | CREAD;
   	 
    	newtio.c_iflag = IGNPAR;
    
    	newtio.c_oflag = 0;
    	newtio.c_lflag = 0;
    	tcflush(fd, TCIFLUSH);
    
    	tcsetattr(fd, TCSANOW, &newtio);
    
    	const char *str = "Hello world";
    	write(fd, str, strlen(str)+1);
    	close(fd);
    	return 0;
}
