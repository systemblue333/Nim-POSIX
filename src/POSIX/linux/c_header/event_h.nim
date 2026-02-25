import type_h

# eventfd2 header

const
  EFD_CLOEXEC*: cint32 = 0x01 # close fd when exec() is called
  EFD_NONBLOCK*: cint32 = 0x02 # nonblocking I/O
  EFD_SEMAPHORE*: cint32 = 0x04 # semaphore like read

const
  AT_EMPTY*: cint32 = 0x1000
  AT_SYMLINK_NOFOLLOW*: cint32 = 0x100