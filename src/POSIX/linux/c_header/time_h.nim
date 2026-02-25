import type_h

type
  clockid_t* = cint32

  time_t* = cint64

  suseconds_t* = cint64

  Timespec* {.packed.} = object
    tv_sec*: time_t
    tv_nsec*: cint64

  Timeval* {.packed.} = object
    tv_sec*: time_t
    tv_usec*: suseconds_t

  Timex* {.packed.} = object
    modes*: cint32
    offset*: cint64
    freq*: cint64
    maxerror*: cint64
    esterror*: cint64
    status*: cint32
    constant*: cint64
    precision*: cint64
    tolerance*: cint64
    time*: Timeval
    tick*: cint64
    ppsfreq*: cint64
    jitter*: cint64
    shift*: cint32
    stabil*: cint64
    jitcnt*: cint64
    calcnt*: cint64
    errcnt*: cint64
    stbcnt*: cint64
    tai*: cint32

  Kernel_Timespec* {.packed.} = object
    tv_sec*: cint64
    tv_nsec*: cint64

  Itimeval* = object
    it_interval*: Timeval
    it_value*: Timeval

const
  CLOCK_REALTIME*: clockid_t = 0
  CLOCK_MONOTONIC*: clockid_t = 1
  CLOCK_PROCESS_CPUTIME_ID*: clockid_t = 2
  CLOCK_THREAD_CPUTIME_ID*: clockid_t = 3
  CLOCK_MONOTONIC_RAW*: clockid_t = 4
  CLOCK_REALTIME_COARSE*: clockid_t = 5
  CLOCK_MONOTONIC_COARSE*: clockid_t = 6
  CLOCK_BOOTTIME*: clockid_t = 7
  CLOCK_REALTIME_ALARM*: clockid_t = 8
  CLOCK_BOOTTIME_ALARM*: clockid_t = 9

const
  ITIMER_REAL*: cint32 = 0
  ITIMER_VIRTUAL*: cint32 = 1
  ITIMER_PROF*: cint32 = 2
