import type_h

# epoll_create1 header

const
  EPOLL_CLOEXEC*: cint32 = 0x80000

# epoll_ctl header

const
  EPOLL_CTL_ADD*: cint32 = 1 # add new fd to epoll instance
  EPOLL_CTL_MOD*: cint32 = 3 # modify fd's event
  EPOLL_CTL_DEL*: cint32 = 2 # remove fd in epoll instance

type
  Epoll_Event* {.packed.} = object
    events*: cuint32
    data*: cuint64