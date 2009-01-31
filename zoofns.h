/* @(#) zoofns.h 2.5 88/01/16 19:03:13 */
/* @(#) zoofns.h 2.7 88/01/27 19:39:18 */

/*
The contents of this file are hereby released to the public domain.

                           -- Rahul Dhesi 1986/11/14
*/

/* Defines function declarations for all Zoo functions */

#ifdef ANSI_HDRS
#include <stdlib.h>
#else
char *memset (char *, int, unsigned);
#endif /* ANSI_HDRS */

long calc_ofs (char *);
char *addext (char *, char *);
char *combine (char[], char *, char *);
VOIDPTR emalloc (unsigned int);
VOIDPTR ealloc (unsigned int);
VOIDPTR erealloc (VOIDPTR, unsigned int);
char *findlast (char *, char *);
char *fixfname (char *);
char *getstdin (void);
char *lastptr (char *);
char *nameptr (char *);
char *newcat (char *, char *);
char *nextfile (int, char *, int);
int cfactor (long, long);
int chname (char *, char *);
int cmpnum (unsigned int, unsigned int, unsigned int, unsigned int);
T_SIGNAL ctrl_c (int);
int exists (char *);
int getfile (ZOOFILE, ZOOFILE, long, int);
int getutime (char *, unsigned *, unsigned *);
int gettime (ZOOFILE, unsigned *, unsigned *);
T_SIGNAL handle_break (int);

int kill_files (char *[], int);
#ifdef UNBUF_IO
int lzc (int, int);
int lzd (int, int);
#else
int lzc (ZOOFILE, ZOOFILE);
int lzd (ZOOFILE, ZOOFILE);
#endif

int lzh_encode (FILE *infile, FILE *outfile);
int lzh_decode (FILE *infile, FILE *outfile);

int match_half (char *, char *);
int samefile (char *, char *);
int settime (ZOOFILE, unsigned, unsigned);
int setutime (char *, unsigned, unsigned);
int str_icmp (char *, char *);

void zooexit (int);
long inlist (char *, unsigned int *, unsigned int *, unsigned *,unsigned *, unsigned *, long *, int);
unsigned long space (int, int *);
void addbfcrc (char *, int);
void addfname (char *, long, unsigned int, unsigned int, unsigned, unsigned);
void add_version (char *, struct direntry *);
void basename (char *, char []);
void break_off (void);
void close_file (ZOOFILE);
void comment (char *, char *);
void extension (char *, char []);
void exit (int);
void fixslash (char *);
void makelist (int, char *[], char *[], int, char *, char *, char *, int *);
void memerr (unsigned int);
void prterror (int, char *, ...);
void rootname (char *, char *);
void skip_files (ZOOFILE, unsigned int *, unsigned int *, int *, char [], long *);
void writenull (ZOOFILE, int);
void zooadd (char *, int, char **, char *);
void zoodel (char *, char *, int);
void zoofilt (char *);
void zooext (char *, char *);
void zoolist (char **, char *, int);
void zoopack (char *, char *);

char *str_dup (char *);
char *str_lwr (char *);

