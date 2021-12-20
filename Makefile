#
# Copyright (c) 2021 Krzysztof Czurylo
#
# xxx

CFLAGS += -ggdb -O0

DIRS = src

OBJDIR = ./obj
BINDIR = ./bin

SRC  = $(foreach dir, $(DIRS), $(wildcard $(dir)/*.c))
OBJS = $(addprefix $(OBJDIR)/, $(patsubst %.c, %.o, $(SRC)))
DEPS = $(addprefix $(OBJDIR)/, $(patsubst %.c, %.d, $(SRC)))

PROG_ = demo
PROG = $(BINDIR)/$(PROG_)


all: $(PROG)

$(OBJS): | $(OBJDIR)

$(OBJDIR) $(BINDIR):
	mkdir -p $@


$(PROG): $(OBJS) | $(BINDIR)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

$(OBJDIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) -MD -c -o $@ $(CFLAGS) $(INCS) $<
	$(CC) -c -o $@ $(CFLAGS) $(INCS) $<


cstyle:
	@echo "Check coding style"

check-commit-msg::
	@echo "Check commit message format/content"

check:
	@echo "Run tests"
	cd test; ./RUNTEST.sh

clean:
	$(RM) $(OBJS_CPP) $(OBJ_C) $(PROG) $(DEPS)


.PHONY: all clean cstyle check-commit-msg check

-include $(DEPS)

