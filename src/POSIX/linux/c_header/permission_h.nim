import type_h

type
  uid_t* = cuint32
  gid_t* = cuint32
  pid_t* = cint32

const
  PRIO_PROCESS*: cint32 = 0
  PRIO_PGRP*: cint32 = 1
  PRIO_USER*: cint32 = 2
