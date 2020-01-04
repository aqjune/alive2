// Copyright (c) 2018-present The Alive2 Authors.
// Distributed under the MIT license that can be found in the LICENSE file.

#include "util/config.h"
#include <iostream>

using namespace std;

static ostream *debug_os = &cerr;

namespace util::config {

unsigned encoding_to = 30 * 60 * 1000; // 30 mins
bool symexec_print_each_value = false;
bool skip_smt = false;
bool disable_poison_input = false;
bool disable_undef_input = false;
bool debug = false;
bool andor_freeze = false;
bool inputmem_simple = false;
bool ptrcmp_phy = false;
bool disable_byte_widening = false;
bool disable_bitsofs_opt = false;
bool disable_byte_specialization = false;
bool disable_memsetcpy_unroll = false;
bool addresses_observed = false;

ostream &dbg() {
  return *debug_os;
}

void set_debug(ostream &os) {
  debug_os = &os;
}

}
