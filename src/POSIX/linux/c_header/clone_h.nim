import type_h

type
  Clone_Args* = object
    flags* {.align: 8.} : cuint64
    pidfd* {.align: 8.} : cuint64
    child_tid* {.align: 8.} : cuint64
    parent_tid* {.align: 8.} : cuint64
    exit_signal* {.align: 8.} : cuint64
    stack* {.align: 8.} : pointer
    stack_size* {.align: 8.} : cuint64
    tls* {.align: 8.} : pointer
    set_tid* {.align: 8.} : cuint64
    set_tid_size* {.align: 8.} : cuint64
    cgroup* {.align: 8.} : cuint64

const
  # Signal mask to send when child exits
  CSIGNAL*: cuint64 = 0x000000ff'u64

  # Share virtual memory space (same address space)
  CLONE_VM*: cuint64 = 0x00000100'u64

  # Share filesystem info (cwd, root, etc.)
  CLONE_FS*: cuint64 = 0x00000200'u64

  # Share open file descriptors
  CLONE_FILES*: cuint64 = 0x00000400'u64

  # Share signal handlers and blocked signals
  CLONE_SIGHAND*: cuint64 = 0x00000800'u64

  # Return pidfd in parent (Linux 5.4+)
  CLONE_PIDFD*: cuint64 = 0x00001000'u64

  # Allow tracing to continue in child
  CLONE_PTRACE*: cuint64 = 0x00002000'u64

  # Parent waits for child to release memory (vfork-like)
  CLONE_VFORK*: cuint64 = 0x00004000'u64

  # Child uses same parent as caller
  CLONE_PARENT*: cuint64 = 0x00008000'u64

  # Join same thread group (used for pthreads)
  CLONE_THREAD*: cuint64 = 0x00010000'u64

  # Create new mount namespace
  CLONE_NEWNS*: cuint64 = 0x00020000'u64

  # Share System V semaphore undo semantics
  CLONE_SYSVSEM*: cuint64 = 0x00040000'u64

  # Set up new TLS for child thread
  CLONE_SETTLS*: cuint64 = 0x00080000'u64

  # Set child TID in parent memory
  CLONE_PARENT_SETTID*: cuint64 = 0x00100000'u64

  # Clear child TID on exit
  CLONE_CHILD_CLEARTID*: cuint64 = 0x00200000'u64

  # Deprecated (ignored by kernel)
  CLONE_DETACHED*: cuint64 = 0x00400000'u64

  # Prevent tracer from forcing CLONE_PTRACE
  CLONE_UNTRACED*: cuint64 = 0x00800000'u64

  # Set child TID in child memory
  CLONE_CHILD_SETTID*: cuint64 = 0x01000000'u64

  # Create new cgroup namespace
  CLONE_NEWCGROUP*: cuint64 = 0x02000000'u64

  # Create new UTS namespace (hostname/domain)
  CLONE_NEWUTS*: cuint64 = 0x04000000'u64

  # Create new IPC namespace
  CLONE_NEWIPC*: cuint64 = 0x08000000'u64

  # Create new user namespace
  CLONE_NEWUSER*: cuint64 = 0x10000000'u64

  # Create new PID namespace
  CLONE_NEWPID*: cuint64 = 0x20000000'u64

  # Create new network namespace
  CLONE_NEWNET*: cuint64 = 0x40000000'u64

  # Share I/O context
  CLONE_IO*: cuint64 = 0x80000000'u64

  # Reset signal handlers to default (SIG_DFL)
  CLONE_CLEAR_SIGHAND*: cuint64 = 0x100000000'u64

  # Place child into specific cgroup (via fd)
  CLONE_INTO_CGROUP*: cuint64 = 0x200000000'u64

  # Create new time namespace (Linux 5.6+)
  CLONE_NEWTIME*: cuint64 = 0x00000080'u64