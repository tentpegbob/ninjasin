/* Issues with python capstone? find /usr -iname 'libcapstone*'
  ln -s `find /usr -iname 'libcapstone*'` /usr/local/lib/python2.7/dist-packages/capstone/libcapstone.so
  */

#include <stdio.h>
#include <string.h>

typedef struct STRUCT_A_T{
	char buff_one[100];
	char buff_two[100];
} sat;

int generate_token(){
	int val = 0xdeadbeef;
	__asm__( "mov %%esp, %%eax;"
	         "not %%eax;"
	         "mov %%eax, %0;"
		     :"=r"(val) );
	return val;
}

int main(){
	sat buf = {0};

	puts("Buffer overflows 101\n");
	puts("Please enter your validation token: ");
	gets(buf.buff_one);

	snprintf(buf.buff_two, sizeof(buf.buff_two), "%x", generate_token());

	if (strstr(buf.buff_one, buf.buff_two)){
		printf("Congrats you have found the correct token, which was: %s", buf.buff_two);
	}else{
		char *buff = buf.buff_two;
		printf("You failed the correct token was: %s", buff);
	}

	printf(buf.buff_one);

	puts("\n");
	return 0;
}
