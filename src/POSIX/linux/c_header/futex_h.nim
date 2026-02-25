import type_h

const
  FUTEX_WAIT*: cint32 = 0
  FUTEX_WAKE*: cint32 = 1
  FUTEX_FD*: cint32 = 2
  FUTEX_REQUEUE*: cint32 = 3
  FUTEX_CMP_REQUEUE*: cint32 = 4
  FUTEX_WAKE_OP*: cint32 = 5
  FUTEX_LOCK_PI*: cint32 = 6
  FUTEX_UNLOCK_PI*: cint32 = 7
  FUTEX_TRYLOCK_PI*: cint32 = 8
  FUTEX_WAIT_BITSET*: cint32 = 9
  FUTEX_WAKE_BITSET*: cint32 = 10
  FUTEX_WAIT_REQUEUE_PI*: cint32 = 11
  FUTEX_CMP_REQUEUE_PI*: cint32 = 12

const
  FUTEX_32*: cint32 = 0x0 # default 32 bit futex
  FUTEX_PRIVATE*: cint32 = 0x80 # process inside private futex

type
  Futex_Waitv* {.packed.} = object
    uaddr*: pointer
    val*: cuint32
    flags*: cuint32
    reserved8: cint64