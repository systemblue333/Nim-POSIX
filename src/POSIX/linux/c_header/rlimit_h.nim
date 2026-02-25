import type_h

const
  RLIMIT_CPU*: cint32 = 0 # max cpu time per second
  RLIMIT_FSIZE*: cint32 = 1 # max file size that can generate
  RLIMIT_DATA*: cint32 = 2 # max heap size
  RLIMIT_STACK*: cint32 = 3 # max stack size
  RLIMIT_CORE*: cint32 = 4 # max coredump file size
  RLIMIT_RSS*: cint32 = 5 # max real memory size(ignored in Linux)
  RLIMIT_NPROC*: cint32 = 6 # max process that can generate
  RLIMIT_NOFILE*: cint32 = 7 # max file discripter that can open
  RLIMIT_MEMLOCK*: cint32 = 8 # max memory size that can lock with mlock
  RLIMIT_AS*: cint32 = 9 # max virtual memory size
  RLIMIT_LOCKS*: cint32 = 10 # max file lock
  RLIMIT_SIGPENDING*: cint32 = 11 # max waiting singal
  RLIMIT_MSGQUEUE*: cint32 = 12 # max byte that can use in POSIX message queue
  RLIMIT_NICE*: cint32 = 13 # range of nice value
  RLIMIT_RTPRIO*: cint32 = 14 # realtime priority setting range
  RLIMIT_RTTIME*: cint32 = 15 # max time that real time task can use CPU(micro second)

type
  Rlimit* = object
    rlim_cur* = cuint64
    rlim_max* = cuint64