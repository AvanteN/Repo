#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <pthread.h>

#define COM4 "/dev/ttyS3"
#define BAUDRATE 115200

int OpenSerial(char *device_name);
int CloseSerial(int fd);
void *AnotherPortReceive(void *fd);

int main(void)
{
	int FdPort1;
	int ReadMsgSize = 0;
	int RunOtherSerial;
	unsigned char DataBuf[50];

	pthread_t thread1;
	FdPort1 = OpenSerial(COM4);
	memset(DataBuf,0,50*sizeof(unsigned char));

	RunOtherSerial = pthread_create(&thread1,NULL,AnotherPortReceive,(void *)FdPort1);

	while(1)
	{
		ReadMsgSize = read(FdPort1, DataBuf,1);
		if(ReadMsgSize > 0)
			printf("%x,%D",DataBuf[0],ReadMsgSize);
	}
	CloseSerial(FdPort1);

	return 0;

}

int OpenSerial(char *device_name)
{
	int fd;
	struct termios newtio;

	fd = open(device_name,O_RDWR|O_NOCTTY);

	if(fd<0)
	{
		printf("Serial Port Open Fail. \n");
		return -1;
	}

	memset(&newtio,0,sizeof(newtio));
	newtio.c_iflag = IGNPAR;
	newtio.c_oflag = 0;
	newtio.c_cflag = CS8|CLOCAL|CREAD;
	
	switch(BAUDRATE)
	{
		case 115200: newtio.c_cflag|=B115200;
			     break;
		case 57600 : newtio.c_cflag|=B57600;
			     break;
		default : newtio.c_cflag |=B115200;
			  break;
	}
	newtio.c_lflag=0;
	newtio.c_cc[VTIME]=20;
	newtio.c_cc[VMIN]=0;
	
	tcflush(fd,TCIFLUSH);
	tcsetattr(fd, TCSANOW, &newtio);

	return fd;
	
}

int CloseSerial(int fd){

	close(fd);
}

void *AnotherPortReceive(void *fd)
{
	int FileDescriptor;
	int ReadMsgSize = 0;
	unsigned char DataBuf[50];
	
	memset(DataBuf,0,50*sizeof(unsigned char));
	FileDescriptor = (int)fd;


	while(1)
	{
		ReadMsgSize = read(FileDescriptor, DataBuf, 1);
		if(ReadMsgSize>0)
			printf("%x %d",DataBuf[0],ReadMsgSize);
	}
}

