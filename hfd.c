#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>


char  version[40] = "hfd v001.6 24oct12 by Ed Rantanen";

#define PRINT(print_method,elemnt1,elemnt2)  printf(print_method, n[incr], n[incr+1])
#define PRINT_Num_Elements(l_fmt, elementGroup) printf(l_fmt, elementGroup)

void print_k() {
      printf("printing k from case switch\n");
    }

void print_default() {
      printf("printing default from case switch\n");
    }




/*****************************************
 *   hfd -> hex file dump
 *
 * This program reads in data, and does
 * a display depending on conditionals 
 * requested. 
 *
 * by: Ed Rantanen
 * updated: 15 Nov 2012
 *
 * updates and documentation 
 *      at github.com/erantanen/hfd
 *
 ****************************************/

int  main(int argc, char *argv[])
{
/* initial declarations */
  int option = 0;
  int incr;
  int dataBits = 16;
  int numberofElements = 1;
  int elementGroup = 0;       /*number of bits read */
  unsigned char  n[dataBits]; /* holder of data */
/*  char  *file_in;*/
  char  *print_method;        /* print fmt for block */
  char  *l_fmt;               /* print fmt for lines */
  FILE  *filehandle_in;


/*************************
 * parsing argv elements *
 *************************/

   while((option=getopt(argc, argv, "k")) != -1) {
            switch (option) {
                  case 'k' : print_k();
                      break;
                    default: print_default();
                      exit(0);
             } //swtich
    } //while



   if(argc < 2 || argc > 4) {
      printf("\n 1 In correct usage,\n \' hfd -help \'\n");
      printf("Try for a better understanding of how to use hfd.\n\n");
      exit(1);
    }

   /* prep for switches */
       print_method = " %02x%02x ";  /* default print */
       l_fmt = "\n %06x:";          /* default line numbering */
    
        if(strcmp(argv[1], "-u") == 0) {
              
            print_method = " %02X%02X ";         
               if((filehandle_in = fopen( argv[2], "r")) == NULL) {
                 printf("\n 2 In correct usage,\n \' hfd -help \'\n");
                 printf("Try for a better understanding of how to use hfd.\n\n");
                 exit(1);
                } else {
                     filehandle_in = fopen( argv[2], "r");
                }

           } else if(strcmp(argv[1], "-I") == 0) {

                   int c=0;
                   printf("This is for command line input,\n enter data when finished hit return\n");
                   while((c=getchar()) != 10){
                     printf("%x ",c);
                    }

                   printf("\nThis is the end of command line input\n");
                   exit(0); 
           } else if(strcmp(argv[1], "-d") == 0) {

             print_method = " %3d %3d";

               if((filehandle_in = fopen( argv[2], "r")) == NULL) {
                 printf("\n 2 In correct usage,\n \' hfd -help \'\n");
                 printf("Try for a better understanding of how to use hfd.\n\n");
                 exit(1);
                } else {
                     filehandle_in = fopen( argv[2], "r");
                }
         } else if(strcmp(argv[1], "-ps") == 0) {
                         
            print_method = "%02x%02x";
            l_fmt = "\n";               
               if((filehandle_in = fopen( argv[2], "r")) == NULL) {
                 printf("\n 2 In correct usage,\n \' hfd -help \'\n");
                 printf("Try for a better understanding of how to use hfd.\n\n");
                 exit(1);
                } else {
                     filehandle_in = fopen( argv[2], "r");
                }

        } else if(strcmp(argv[1], "-v") == 0) {
            printf("\n%s \n\n", version);
            exit(1);

        } else if(strcmp(argv[1], "-c") == 0) {
        
                dataBits = atoi(argv[2]); /* convert arg to int */
              if((filehandle_in = fopen( argv[3], "r")) == NULL) {
                 printf("\n 2 In correct usage,\n \' hfd -help \'\n");
                 printf("Try for a better understanding of how to use hfd.\n\n");
                 exit(1);
                } else {
                     filehandle_in = fopen( argv[3], "r");
                }   

        } else if(strcmp(argv[1], "-h") == 0) {
           int systemresult =  system("man ./hfd_man");
           if(systemresult == -1) {
              printf("Unable to locate help file\n");
             }
            exit(1);

        } else if((filehandle_in = fopen( argv[1], "r")) == NULL) {
            printf("\n 2 In correct usage,\n \' hfd -help \'\n");
            printf("Try for a better understanding of how to use hfd.\n\n");
            exit(1);
        }

 /* begin file process */

 while( numberofElements != 0) {

  numberofElements = fread(n, sizeof(char), dataBits, filehandle_in);
    
 /* begin internal print block */
     
     PRINT_Num_Elements(l_fmt, elementGroup); /* line numbering */
   
     for(incr = 0; incr < dataBits ; incr+=2){  PRINT(print_method, n[incr], n[incr+1]); } 

     printf("\t");

     for(incr = 0; incr < dataBits ; incr++){

     /*  usable ascii symbols are 33 to 126 */
      if ( n[incr] < 32 || n[incr] > 127 ){
          printf(".");
        }
      else 
       {
         printf("%c", (char)n[incr]);
       }
    }

   elementGroup = elementGroup + dataBits;
 }

/* end of while */

    printf("\n\n"); /* simple clean up after run */

fclose(filehandle_in);

return(0); 
}
