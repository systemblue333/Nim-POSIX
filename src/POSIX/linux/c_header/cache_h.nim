import type_h

type
  Cachestat_Range* {.packed.} = object
    off*: cuint64
    len*: cuint64

  Cachestat* {.packed.} = object
    nr_cache*: cuint64
    nr_dirty*: cuint64
    nr_writeback*: cuint64
    nr_evicted*: cuint64
    nr_recently_evicted*: cuint64