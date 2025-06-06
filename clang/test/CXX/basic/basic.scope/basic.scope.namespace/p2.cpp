// RUN: rm -rf %t
// RUN: mkdir -p %t
// RUN: echo '#ifndef FOO_H' > %t/foo.h
// RUN: echo '#define FOO_H' >> %t/foo.h
// RUN: echo 'extern int in_header;' >> %t/foo.h
// RUN: echo '#endif' >> %t/foo.h
// RUN: %clang_cc1 -std=c++2a -I%t -emit-module-interface -DINTERFACE %s -o %t.pcm
// RUN: %clang_cc1 -std=c++2a -I%t -fmodule-file=A=%t.pcm -DIMPLEMENTATION %s -verify -fno-modules-error-recovery
// RUN: %clang_cc1 -std=c++2a -I%t -fmodule-file=A=%t.pcm %s -verify -fno-modules-error-recovery

#ifdef INTERFACE
module;
#include "foo.h"
// FIXME: The following need to be moved to a header file. The global module
// fragment is only permitted to contain preprocessor directives.
int global_module_fragment;
export module A;
export int exported;
int not_exported;
static int internal;

module :private;
int not_exported_private;
static int internal_private;
#else

#ifdef IMPLEMENTATION
module;
#endif

void test_early() {
  in_header = 1; // expected-error {{use of undeclared identifier 'in_header'}}
  // expected-note@* {{not visible}}

  global_module_fragment = 1; // expected-error {{use of undeclared identifier 'global_module_fragment'}}

  exported = 1; // expected-error {{use of undeclared identifier 'exported'}}

  not_exported = 1; // expected-error {{use of undeclared identifier 'not_exported'}}

  // FIXME: We need better diagnostic message for static variable.
  internal = 1; // expected-error {{use of undeclared identifier 'internal'}}

  not_exported_private = 1; // expected-error {{undeclared identifier}}

  internal_private = 1; // expected-error {{undeclared identifier}}
}

#ifdef IMPLEMENTATION
module A;
#else
import A;
#endif

void test_late() {
  in_header = 1; // expected-error {{missing '#include "foo.h"'; 'in_header' must be declared before it is used}}
  // expected-note@* {{not visible}}

  global_module_fragment = 1; // expected-error {{missing '#include'; 'global_module_fragment' must be declared before it is used}}

  exported = 1;

  not_exported = 1;
#ifndef IMPLEMENTATION
  // expected-error@-2 {{use of undeclared identifier 'not_exported'; did you mean 'exported'?}}
  // expected-note@p2.cpp:18 {{'exported' declared here}}
#endif

  internal = 1; // expected-error {{use of undeclared identifier 'internal'}}

  not_exported_private = 1;
#ifndef IMPLEMENTATION
  // FIXME: should not be visible here
  // expected-error@-3 {{undeclared identifier}}
#endif

  internal_private = 1; // expected-error {{use of undeclared identifier 'internal_private'}}
}

#endif
