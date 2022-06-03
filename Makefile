CC	?= gcc
CFLAGS	?= -W -Wall
LDFLAGS ?=

all: rtk_hciattach

rtk_hciattach: hciattach.c hciattach_rtk.o
	$(CC) $(CFLAGS) -o rtk_hciattach hciattach.c hciattach_rtk.o $(LDFLAGS)

hciattach_rtk.o: hciattach_rtk.c
	$(CC) $(CFLAGS) -c hciattach_rtk.c $(LDFLAGS)

clean:
	rm -f *.o  rtk_hciattach tags cscope.*

tags: FORCE
	ctags -R
	find ./ -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" > cscope.files
	cscope -bkq -i cscope.files
PHONY += FORCE
FORCE:
