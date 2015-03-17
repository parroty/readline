#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <readline/readline.h>
#include <readline/history.h>
#include "erl_nif.h"

/* nif functions */
static int load(ErlNifEnv* env, void** priv, ERL_NIF_TERM load_data);
static void unload(ErlNifEnv* env, void* priv);

/* helper functions */
static ERL_NIF_TERM result_code(ErlNifEnv* env, int code);
static ERL_NIF_TERM result_string(ErlNifEnv* env, char *string);

/* api functions */
static ERL_NIF_TERM e_readline(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);
static ERL_NIF_TERM e_add_history(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);
static ERL_NIF_TERM e_scanf(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);
static ERL_NIF_TERM e_printf(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]);