#include <stdio.h>


void main()
{

 int i;
 int b =16;
 int numberofElements = 1;
 int elementGroup = 0;

 unsigned char  n[b];
 FILE *filehandle_in;

 filehandle_in = fopen("a.out", "r");
 
 while( numberofElements != 0) {

  numberofElements = fread(n, sizeof(char), 16, filehandle_in);
    
 /* begin internal print block */

   printf("\n %06x:", elementGroup);

   for(i = 0; i < b ; i+=2){
	   printf(" %02X%02X ", n[i], n[i+1]);

    } 

    printf("\t");

    for(i = 0; i < b ; i++){

     /*  usable ascii symbols are 33 to 126 */
      if ( n[i] < 32 || n[i] > 126 ){
          printf(".");
        }
     else 
       {
         printf("%c", (char)n[i]);
       }

    }

   elementGroup = elementGroup + 16;
 }

/* end of internal print block */

    printf("\n\n");



fclose(filehandle_in);

 
}
