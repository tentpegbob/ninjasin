#include <stdio.h>

int main(){
	char buf[100] = {0};
	puts("Buffer overflows 101\n\n");
	puts("Please enter some text into this exploitable program: ");
	gets(buf);
	puts(buf);
	return 0;
}
