CC?=clang
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
ERLANG_FLAGS?=-I$(ERLANG_PATH)
EBIN_DIR?=ebin

PRIV_DIR=priv
SRC_DIR=src
READLINE=readline

NIF_SRC=$(SRC_DIR)/readline.c
NIF_LIB=$(PRIV_DIR)/readline.so

OPTIONS=-shared
ifeq ($(shell uname),Darwin)
OPTIONS+= -dynamiclib -undefined dynamic_lookup
endif
INCLUDES=-I$(SRC_DIR)

OPTFLAGS?=-fPIC -std=c99 -Wall -lreadline
CFLAGS=-O2 $(OPTFLAGS) $(INCLUDES)
CMARK_OPTFLAGS=-DNDEBUG

all: $(NIF_LIB)

$(PRIV_DIR):
	@mkdir -p $@ $(NOOUT)

$(NIF_LIB): $(PRIV_DIR) $(NIF_SRC)
	$(CC) $(CFLAGS) $(ERLANG_FLAGS) $(OPTIONS) $(NIF_SRC) -o $@

$(READLINE):
	@mix deps.get
	@mix compile

clean:
	rm -f $(PRIV_DIR)/*
