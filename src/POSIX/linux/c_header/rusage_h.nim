import type_h

const
  RUSAGE_SELF*: cint32 = 0
  RUSAGE_CHILDREN*: cint32 = -1
  RUSAGE_THREAD*: cint32 = 1

type
  rusage* = object
    ru_utime*: Timeval # user mode CPU time
    ru_stime*: Timeval # kernel mode CPU time
    ru_maxrss*: cint64 # max resident set size
    ru_ixrss*: cint64 # share memory size
    ru_idrss*: cint64 # non share memory size
    ru_isrss*: cint64 # stack size
    ru_minflt*: cint64 # soft page fault size
    ru_majflt*: cint64 # hard page fault size
    ru_nswap*: cint64 # swap number
    ru_inblock*: cint64 # block input number
    ru_oublock*: cint64 # block output number
    ru_msgsnd*: cint64 # message send number
    ru_msgrcv*: cint64 # message receive number
    ru_nsignals*: cint64 # receive signal number
    ru_nvcsw*: cint64 # voluntary context switching number
    ru_nivcsw*: cint64 # involuntary context switching number