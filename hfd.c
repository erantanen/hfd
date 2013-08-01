#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include "hfd_process.h"
#include "hfd_print.h"


#define PRINT(print_method,elemnt1,elemnt2)  printf(print_method, n[incr], n[incr+1])
#define PRINT_Num_Elements(l_fmt, elementGroup) printf(l_fmt, elementGroup)

char *file_in;
char *file_out;





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
 *  test of dev
 *
 * updates and documentation 
 *      at github.com/erantanen/hfd
 *
 ****************************************/

int  main(int argc, char *argv[])
{
/* initial declarations */

int option = 0;
int flag_file_in, flag_file_out, flag_cmd_in;
char  file_in, file_out;

/*************************
 * parsing argv elements *
 *************************/
   if(argc == 1) {
       printf("This program needs arguments....\n\n");
     }


   while((option=getopt(argc, argv, "duvhi:o:")) != -1) {
            switch (option) {
                  case 'h' : print_help();
                      break;
                  case 'v' : print_version();
                      break;
                  case 'i' : flag_file_in =  atoi(optarg);
                                  file_in =  optarg;
                      break;
                  case 'o' : flag_file_out = atoi(optarg);
                                  file_out = optarg;
                      break;
                  case 'c' : flag_cmd_in =optarg;
                      break;
                  default: print_usage();
                      exit(EXIT_FAILURE);
    
             } //swtich
    } //while

// Beginning processing

           printf("blah\n");


   if(flag_file_in == -1 || flag_cmd_in == -1) {
        
        print_usage();

 
   }



return(0); 
}
