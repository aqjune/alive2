// Copyright (c) 2018-present The Alive2 Authors.
// Distributed under the MIT license that can be found in the LICENSE file.

#include "util/symexec.h"
#include "util/errors.h"
#include "ir/function.h"
#include "ir/state.h"
#include "util/config.h"
#include <iostream>
#include <chrono>

using namespace IR;
using namespace std;

namespace util {

void sym_exec(State &s) {
  auto t_start = chrono::system_clock::now();
  Function &f = const_cast<Function&>(s.getFn());

  // add constants & inputs to State table first of all
  for (auto &l : { f.getConstants(), f.getInputs(), f.getUndefs() }) {
    for (const auto &v : l) {
      s.exec(v);
    }
  }

  s.exec(Value::voidVal);

  bool first = true;
  if (f.getFirstBB().getName() != "#init") {
    s.finishInitializer();
    first = false;
  }

  // TODO: remove copy
  auto BBs = f.getBBs();
  for (auto &bb : BBs) {
    if (!s.startBB(*bb))
      continue;

    for (auto &i : bb->instrs()) {
      auto val = s.exec(i);
      auto &name = i.getName();

      auto t_end = chrono::system_clock::now();
      auto msec = chrono::duration_cast<chrono::milliseconds>(t_end - t_start)
                  .count();
      if (msec >= config::encoding_to)
        throw AliveException("Encoding timeout", false);

      if (config::symexec_print_each_value && name[0] == '%')
        cout << name << " = " << val << '\n';
    }

    if (first)
      s.finishInitializer();
    first = false;
  }

  if (config::symexec_print_each_value) {
    cout << "domain = " << s.returnDomain()
         << "\nreturn = " << s.returnVal().first
         << s.returnMemory() << "\n\n";
  }
}

}
