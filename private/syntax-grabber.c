#include "scheme.h"
#include <stdio.h>

#include "/Users/leif/racket/racket/src/racket/src/schpriv.h"

Scheme_Object *unsafe_syntax_to_datum(int argc, Scheme_Object** argv) {
  Scheme_Stx *v = argv[0];
  return v->val;
}

Scheme_Object *scheme_initialize(Scheme_Env *env) {
  Scheme_Env *mod_env;
  mod_env = scheme_primitive_module(scheme_intern_symbol("syntax-grabber"), env);
  scheme_add_global("unsafe-syntax->datum",
                    scheme_make_prim_w_arity(unsafe_syntax_to_datum, "unsafe-syntax->datum", 1, 1),
                    mod_env);
  scheme_finish_primitive_module(mod_env);
  return scheme_void;
}

Scheme_Object *scheme_reload(Scheme_Env *env) {
  return scheme_initialize(env);
}

Scheme_Object *scheme_module_name(void) {
  return scheme_intern_symbol("syntax-grabber");
}
