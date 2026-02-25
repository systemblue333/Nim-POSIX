import type_h

type
  Robust_List* {.packed.} = object
    next*: ptr Robust_List

  Robust_List_Header* {.packed.} = object
    list* = Robust_List
    futex_offset*: cint64
    list_op_pending*: ptr Robust_List