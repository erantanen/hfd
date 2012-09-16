#include <stdio.h>
#include <stdlib.h>




void main(int argc, char *argv[])
{
/* initial declarations */
  int incr;
  int dataBits = 16;
  int numberofElements = 1;
  int elementGroup = 0;
  unsigned char  n[dataBits];
  char *file_in;
  FILE *filehandle_in;

/*************************
 * parsing argv elements *
 *************************/

   if(argc != 2) {
      printf("In correct usage,\n \' hfd -help \'\n Try for a better understanding of how to use hfd.\n");
      exit(1);
    }

    

   if(argv[1] != "-") {
       filehandle_in = fopen( argv[1], "r");;
       
    }       

 
 while( numberofElements != 0) {

  numberofElements = fread(n, sizeof(char), dataBits, filehandle_in);
    
 /* begin internal print block */

   printf("\n %06x:", elementGroup);

   for(incr = 0; incr < dataBits ; incr+=2){
	   printf(" %02X%02X ", n[incr], n[incr+1]);

    } 

    printf("\t");

    for(incr = 0; incr < dataBits ; incr++){

     /*  usable ascii symbols are 33 to 126 */
      if ( n[incr] < 32 || n[incr] > 126 ){
          printf(".");
        }
     else 
       {
         printf("%c", (char)n[incr]);
       }

    }

   elementGroup = elementGroup + 16;
 }

/* end of internal print block */

    printf("\n\n");



fclose(filehandle_in);

 
}
