// Copyright (c) 2018-present The Alive2 Authors.
// Distributed under the MIT license that can be found in the LICENSE file.

#include "smt/ctx.h"
#include "smt/smt.h"
#include <z3.h>
#include <string>
using namespace std;

namespace smt {

context ctx;

void context::init() {
  Z3_global_param_set("model.partial", "true");
  Z3_global_param_set("smt.ematching", "false");
  Z3_global_param_set("smt.mbqi.max_iterations", "1000000");
  Z3_global_param_set("timeout", get_query_timeout());
  // Disable Z3's use of UFs for NaNs when converting FPs to BVs
  // They generate incorrect formulas when quantifiers are involved
  Z3_global_param_set("rewriter.hi_fp_unspecified", "true");
  auto mem_mb = to_string(get_memory_limit() / 1024 / 1024);
  Z3_global_param_set("memory_max_size", mem_mb.data());
  ctx = Z3_mk_context_rc(nullptr);
}

void context::destroy() {
  Z3_del_context(ctx);
}

}
