# derived from: @(#) makefile 2.2 88/01/27 19:37:59 
# $Id: makefile,v 1.22 91/07/09 04:10:38 dhesi Exp $
# Make Zoo
#
#The contents of this makefile are hereby released to the public domain.
#                                  -- Rahul Dhesi 1991/07/05
#
# This makefile expects two macro names, `CFLAGS' and `EXTRA', to hold
# all the switches to be supplied to the C compiler.  It also expects
# a macro `LDFLAGS' to hold the switch for the loader when invoked.
# The macro "MODEL" holds switches needed for both compile and link, 
# such as "memory model" for Intel and Z8000 processors. OPTIM is the 
# optimize option and may be set on the make command line to -O2 or 
# whatever your compiler thinks is nice.
#


MAKE = make	      # needed for some systems e.g. older BSD

CC = gcc
CFLAGS = -c -DGENERIC -DANSI_HDRS -DSTDARG -DBIG_MEM -DNDEBUG -Os -fomit-frame-pointer -fexpensive-optimizations -g0
EXTRA = 
DESTDIR = /usr/bin

#List of all object files created for Zoo
ZOOOBJS = addbfcrc.o addfname.o basename.o comment.o crcdefs.o \
		getfile.o lzc.o lzd.o machine.o makelist.o misc.o misc2.o \
		nextfile.o needed.o options.o parse.o portable.o prterror.o \
		version.o zoo.o zooadd.o zooadd2.o zoodel.o zooext.o zoofilt.o \
		zoolist.o zoopack.o io.o lzh.o maketbl.o maketree.o huf.o \
		encode.o decode.o nixtime.o

FIZOBJS = fiz.o addbfcrc.o portable.o crcdefs.o

.c.o :
	$(CC) $(CFLAGS) $(EXTRA) $*.c

all : zoo fiz

#######################################################################
# CLEANUP TARGETS
#######################################################################

# standard clean -- remove all transient files
clean :
	rm -f core a.out $(ZOOOBJS) $(FIZOBJS) zoo fiz

# object clean only -- just remove object files
objclean:
	rm -f *.o

#######################################################################
# BINARY TARGETS
#######################################################################

zoo: $(ZOOOBJS)
	$(CC) -o zoo $(LDFLAGS) $(ZOOOBJS)

fiz: $(FIZOBJS)
	$(CC) -o fiz $(LDFLAGS) $(FIZOBJS)

#######################################################################
# DEPENDENCIES
#######################################################################
# DO NOT DELETE THIS LINE -- it marks the beginning of this dependency list

addbfcrc.o: options.h
addfname.o: /usr/include/stdio.h options.h various.h zoo.h zoofns.h zooio.h
addfname.o: zoomem.h
basename.o: /usr/include/stdio.h assert.h debug.h options.h parse.h various.h
basename.o: zoo.h zoofns.h zooio.h
bsd.o: /usr/include/sys/stat.h /usr/include/sys/time.h
bsd.o: /usr/include/sys/types.h nixmode.i nixtime.h nixtime.c
comment.o: /usr/include/signal.h /usr/include/stdio.h
comment.o: /usr/include/sys/signal.h errors.h options.h portable.h various.h
comment.o: zoo.h zoofns.h zooio.h
crcdefs.o: options.h
decode.o: /usr/include/stdio.h ar.h lzh.h options.h zoo.h
encode.o: /usr/include/assert.h /usr/include/stdio.h ar.h errors.h lzh.h
encode.o: options.h zoo.h
fiz.o: /usr/include/stdio.h options.h portable.h various.h zoo.h zoofns.h
fiz.o: zooio.h
generic.o: /usr/include/sys/stat.h /usr/include/sys/types.h
generic.o: /usr/include/time.h nixmode.i nixtime.h nixtime.c
getfile.o: /usr/include/stdio.h options.h various.h zoo.h zoofns.h zooio.h
getfile.o: zoomem.h
huf.o: /usr/include/stdio.h ar.h errors.h lzh.h options.h zoo.h
io.o: /usr/include/stdio.h ar.h errors.h lzh.h options.h portable.h zoo.h
io.o: zooio.h
lzc.o: /usr/include/stdio.h assert.h debug.h lzconst.h options.h various.h
lzc.o: zoo.h zoofns.h zooio.h zoomem.h
lzd.o: /usr/include/stdio.h assert.h debug.h lzconst.h options.h various.h
lzd.o: zoo.h zoofns.h zooio.h zoomem.h
lzh.o: /usr/include/stdio.h ar.h errors.h options.h zoo.h
machine.o: /usr/include/stdio.h options.h various.h zoo.h zoofns.h zooio.h
makelist.o: /usr/include/stdio.h assert.h debug.h errors.h options.h
makelist.o: portable.h various.h zoo.h zoofns.h zooio.h
maketbl.o: /usr/include/stdio.h ar.h lzh.h options.h zoo.h
maketree.o: /usr/include/stdio.h ar.h lzh.h options.h zoo.h
misc.o: /usr/include/signal.h /usr/include/stdio.h /usr/include/sys/signal.h
misc.o: errors.h options.h portable.h various.h zoo.h zoofns.h zooio.h
misc2.o: /usr/include/stdio.h errors.h options.h portable.h various.h zoo.h
misc2.o: zoofns.h zooio.h zoomem.h
msdos.o: /usr/include/stdio.h errors.h options.h zoo.h zoofns.h zooio.h
needed.o: /usr/include/stdio.h debug.h options.h portable.h various.h zoo.h
needed.o: zoofns.h zooio.h
nextfile.o: /usr/include/stdio.h options.h various.h zoo.h
options.o: /usr/include/stdio.h errors.h options.h various.h zoo.h zoofns.h
options.o: zooio.h
parse.o: /usr/include/stdio.h assert.h options.h parse.h various.h zoo.h
parse.o: zoofns.h zooio.h
portable.o: /usr/include/stdio.h assert.h debug.h machine.h options.h
portable.o: portable.h various.h zoo.h zoofns.h zooio.h
prterror.o: /usr/include/stdio.h options.h various.h
prterror.o: zoofns.h zooio.h
vms.o: /usr/include/time.h
vmstime.o: /usr/include/stdio.h
zoo.o: /usr/include/stdio.h errors.h options.h various.h zoo.h zoofns.h
zoo.o: zooio.h zoomem.h
zooadd.o: /usr/include/stdio.h debug.h errors.h options.h parse.h portable.h
zooadd.o: various.h zoo.h zoofns.h zooio.h zoomem.h
zooadd2.o: /usr/include/stdio.h assert.h debug.h errors.h options.h parse.h
zooadd2.o: various.h zoo.h zoofns.h zooio.h
zoodel.o: /usr/include/signal.h /usr/include/stdio.h /usr/include/sys/signal.h
zoodel.o: errors.h options.h portable.h various.h zoo.h zoofns.h zooio.h
zooext.o: /usr/include/signal.h /usr/include/stdio.h /usr/include/sys/signal.h
zooext.o: errors.h machine.h options.h parse.h portable.h various.h zoo.h
zooext.o: zoofns.h zooio.h
zoofilt.o: options.h
zoolist.o: /usr/include/stdio.h errors.h options.h portable.h various.h zoo.h
zoolist.o: zoofns.h zooio.h zoomem.h
zoopack.o: /usr/include/signal.h /usr/include/stdio.h
zoopack.o: /usr/include/sys/signal.h errors.h options.h portable.h various.h
zoopack.o: zoo.h zoofns.h zooio.h
