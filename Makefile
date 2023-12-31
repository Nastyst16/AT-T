include ../Makefile.common

CHECKFILE = check-at_t
ASMFILE = bonus_at_t
DEPS = $(CHECKFILE).o $(ASMFILE).o
ASFLAGS = $(CFLAGS) -g

all: checker

build: checker

$(CHECKFILE).o: $(CHECKFILE).c

$(ASMFILE).o: $(ASMFILE).S

checker: $(DEPS)
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm *.o checker

debug: checker
	gdb ./checker

.PHONY: debug