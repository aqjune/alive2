#pragma once

// Copyright (c) 2018-present The Alive2 Authors.
// Distributed under the MIT license that can be found in the LICENSE file.

#include <ostream>

namespace util::config {

extern bool symexec_print_each_value;

extern bool skip_smt;

extern bool io_nobuiltin;

extern bool disable_poison_input;

extern bool disable_undef_input;

extern bool debug;

extern bool disable_byte_widening;

extern bool disable_bitsofs_opt;

extern bool disable_byte_specialization;

extern bool addresses_observed;

extern bool disable_memsetcpy_unroll;

extern bool andor_freeze;

extern bool inputmem_simple;

extern bool nonnull_poison;

std::ostream &dbg();
void set_debug(std::ostream &os);

}
