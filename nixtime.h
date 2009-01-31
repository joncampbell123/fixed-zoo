
/*
Time handling routines for UNIX systems.  These are included by the file
machine.c as needed.

The contents of this file are hereby released to the public domain.

                                    -- Rahul Dhesi  1986/12/31
*/

struct tm *localtime();
int gettime (ZOOFILE file,unsigned *date,unsigned *time);
int setutime(char *path,unsigned int date, unsigned int time);
long mstonix (unsigned int date, unsigned int time);

