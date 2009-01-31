/* @(#) portable.h 2.3 87/12/26 12:25:49 */
/* @(#) portable.h 2.4 88/08/24 00:56:43 */

/* Definitions for portable I/O

The contents of this file are hereby released to the public domain.

                           -- Rahul Dhesi 1986/11/14



                       DEFINITIONS IN THIS FILE

Symbols:

Z_WRITE, Z_READ, and Z_RDWR are the parameters to supply to zooopen()
and to open an existing file for write, read, and read-write 
respectively.  Z_NEW is the parameter to supply to zoocreate() to
open an existing file or create a new file for write and read.  The
file must be opened in binary format, with no newline translation of
any kind.

Macros or functions:

zgetc(x) reads a character from ZOOFILE x.
zputc(c, f) writes a character to a ZOOFILE x.
zputchar(c) writes a character c to standard output.
MKDIR(x) creates a directory x.
*/

/* Borland's Turbo C. */
#ifdef   TURBOC
#error NO!
#endif

/* Microsoft C 3.0 */
#ifdef   MSC
#error NO!
#endif

#ifdef VMS
#error NO!
#endif

#ifdef GENERIC
#define  NIX_IO      /* standard **IX I/O */
#define  MKDIR(x) mkdir(x,0755)
#endif

/* **IX System V release 2.1 */
#ifdef   SYS_V
#error NO!
#endif

/* Xenix */
#ifdef   XENIX
#error NO!
#endif

/* 4.3BSD */
#ifdef BSD4_3
#error NO!
#endif

/* Amiga */
#ifdef MCH_AMIGA
#error NO!
#endif

/* Standard **IX I/O definitions */
#ifdef   NIX_IO
/* options for zooopen(), zoocreate() */
#define  Z_WRITE        "r+"
#define  Z_READ         "r"
#define  Z_RDWR         "r+"
#define	Z_NEW				"w+"
#define	zgetc(x)			getc(x)
#define  zputc(c, f)		putc(c, f)
#define	zputchar(c)		putchar(c)
#endif   /* NIX_IO */
