#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "print.h"

char  version[40] = "hfd v000.1 17sep12 by Ed Rantanen";


/*****************************************
 *   hfd -> hex file dump
 *
 * This program reads in data, and does
 * a display depending on conditionals 
 * requested. 
 *
 * by: Ed Rantanen
 * on: 17 Sep 2012
 *
 * updates and documentation 
 *      at github.com/erantanen/hfd
 *
 ****************************************/




void main(int argc, char *argv[])
{
/* initial declarations */
  int incr;
  char *i;
  int dataBits = 16;
  int numberofElements = 1;
  int elementGroup = 0;
  unsigned char  n[dataBits];
  char *argv_entry;
  char *file_in;
  FILE *filehandle_in;



/*************************
 * parsing argv elements *
 *************************/

   if(argc != 2) {
      printf("\n 1 In correct usage,\n \' hfd -help \'\n");
      printf("Try for a better understanding of how to use hfd.\n\n");
      exit(1);
    }


   /* prep for switches */

       argv_entry = argv[1];
       i = strchr(argv_entry, '-');

    
        if(strcmp(argv[1], "-u") == 0) {
            printf("blah u\n");
            exit(1);

        } else if(strcmp(argv[1], "-ps") == 0) {
            printf("blah ps\n");
            exit(1);

        } else if(strcmp(argv[1], "-v") == 0) {
            printf("\n%s \n\n", version);
            exit(1);

        } else if(strcmp(argv[1], "-c") == 0) {
            printf("blah c\n");
            exit(1);

        } else if(strcmp(argv[1], "-h") == 0) {
            printf("blah h\n");
            exit(1);

        } else if((filehandle_in = fopen( argv[1], "r")) == NULL) {
            printf("\n 2 In correct usage,\n \' hfd -help \'\n");
            printf("Try for a better understanding of how to use hfd.\n\n");
            exit(1);

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
