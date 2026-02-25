import ../c_header/bpf_h
import ../c_header/cache_h
import ../c_header/cap_h
import ../c_header/clone_h
import ../c_header/close_range_h
import ../c_header/epoll_h
import ../c_header/errno_h
import ../c_header/event_h
import ../c_header/fanotify_h
import ../c_header/flags_h
import ../c_header/fntcl_h
import ../c_header/futex_h
import ../c_header/permission_h
import ../c_header/rlimit_h
import ../c_header/robust_h
import ../c_header/rusage_h
import ../c_header/sock_h
import ../c_header/syscall_h
import ../c_header/time_h
import ../c_header/type_h

when defined(amd64):
  proc raw_syscall_amd64(num, arg1, arg2, arg3, arg4, arg5, arg6: cint64): cint64 {.importc, cdecl.}

proc exchange(value: pointer): cint64 =
  return cast[cint64](value)

proc exchange[T: SomeInteger](value: T): cint64 =
  return cint64(value)

proc syscall*[T0, T1, T2, T3, T4, T5, T6](reg0: T0, reg1: T1 = 0, reg2: T2 = 0, reg3: T3 = 0, reg4: T4 = 0, reg5: T5 = 0, reg6: T6 = 0): cint32 =
  var ret: cint64
  when defined(amd64):
    ret = raw_syscall_amd64(reg0.amd64, exchange(reg1), exchange(reg2), exchange(reg3), exchange(reg4), exchange(reg5), exchange(reg6))
  when defined(arm64):
    ret = raw_syscall_arm64(reg0.common, exchange(reg1), exchange(reg2), exchange(reg3), exchange(reg4), exchange(reg5), exchange(reg6))
  when defined(riscv64):
    ret = raw_syscall_riscv64(reg0.common, exchange(reg1), exchange(reg2), exchange(reg3), exchange(reg4), exchange(reg5), exchange(reg6))
  when defined(loongarch64):
    ret = raw_syscall_loongarch64(reg0.common, exchange(reg1), exchange(reg2), exchange(reg3), exchange(reg4), exchange(reg5), exchange(reg6))
  return ret.cint32

proc accept*(sockfd: cint32, address: ptr Sockaddr, addrlen: ptr socklen_t): cint32 =
  return syscall(ACCEPT, sockfd, address, addrlen)

proc accept4*(sockfd: cint32, address: ptr Sockaddr, addrlen: ptr socklen_t, flags: cint32): cint32 =
  return syscall(ACCEPT4, sockfd, address, addrlen, flags)

proc acct*(filename: cstring): cint32 =
  return syscall(ACCT, filename)

proc add_key*(keytype: cstring, description: cstring, payload: pointer, plen: csize_t, keyring: key_serial_t): cint32 =
  return syscall(ADD_KEY, keytype, description, payload, plen, keyring)

proc adjtimex*(buf: ptr Timex): cint32 =
  return syscall(ADJTIMEX, buf)

proc `bind`*(sockfd: cint32, address: ptr Sockaddr, addrlen: socklen_t): cint32 =
  return syscall(BIND, sockfd, address, addrlen)

proc bpf*(cmd: cint32, attr: ptr Bpf_attr, size: csize_t): cint32 =
  return syscall(BPF, cmd, attr, size)

proc brk*(end_data_segment: pointer): cint32 =
  return syscall(BRK, end_data_segment)

proc cachestat*(fd: cint32, range: ptr Cachestat_Range, output: ptr Cachestat): cint32 =
  return syscall(CACHESTAT, fd, range, output)

proc capget*(hdrp: ptr User_Cap_Header_Struct, datap: ptr User_Cap_Data_Struct): cint32 =
  return syscall(CAPGET, hdrp, datap)

proc capset*(hdrp: ptr User_Cap_Header_Struct, datap: ptr User_Cap_Data_Struct): cint32 =
  return syscall(CAPSET, hdrp, datap)

proc chdir*(path: cstring): cint32 =
  return syscall(CHDIR, path)

proc chroot*(path: cstring): cint32 =
  return syscall(CHROOT, path)

proc clock_adjtime*(clock_id: clockid_t, tx: ptr Timex): cint32 =
  return syscall(WRITE, clock_id, tx)

proc clock_getres*(clock_id: clockid_t, res: ptr Timespec): cint32 =
  return syscall(CLOCK_GETRES, clock_id, res)

proc clock_gettime*(clock_id: clockid_t, tp: ptr Timespec): cint32 =
  return syscall(CLOCK_GETTIME, clock_id, tp)

proc clock_nanosleep*(clock_id: clockid_t, flags: cint32, req: ptr Timespec, rem: ptr Timespec): cint32 =
  return syscall(CLOCK_NANOSLEEP, clock_id, flags, req, rem)

proc clock_settime*(clock_id: clockid_t, tp: ptr Timespec): cint32 =
  return syscall(CLOCK_SETTIME, clock_id, tp)

proc clone*(flags: cuint64, child_stack: pointer, ptid: pointer, ctid: pointer, newtls: cuint64): cint32 =
  return syscall(CLONE, flags, child_stack, ptid, ctid, newtls)

proc clone3*(cl_args: ptr Clone_Args, size: csize_t): cint32 =
  return syscall(CLONE3, cl_args, size)

proc close*(fd: cint32): cint32 =
  return syscall(CLOSE, fd)

proc connect*(sockfd: cint32, address: ptr Sockaddr, addrlen: socklen_t): cint32 =
  return syscall(CONNECT, sockfd, address, addrlen)

proc delete_module*(name: cstring, flags: cuint32): cint32 =
  return syscall(DELETE_MODULE, name, flags)

proc dup*(oldfd: cint32): cint32 =
  return syscall(DUP, oldfd)

proc dup3*(oldfd: cint32, newfd: cint32, flags: cuint32): cint32 =
  return syscall(DUP3, oldfd, newfd, flags)

proc epoll_create1*(flags: cint32): cint32 =
  return syscall(EPOLL_CREATE1, flags)

proc epoll_ctl*(epfd: cint32, op: cint32, fd: cint32, events: ptr Epoll_Event): cint32 =
  return syscall(EPOLL_CTL, epfd, op, fd, events)

proc epoll_pwait*(epfd: cint32, events: ptr Epoll_Event, maxevents: cint32, timeout: cint32, sigmask: ptr Sigset_t, sigsetsize: csize_t): cint32 =
  return syscall(EPOLL_PWAIT, epfd, events, maxevents, timeout, sigmask, sigsetsize)

proc eventfd2*(initval: cuint32, flags: cint32): cint32 =
  return syscall(EVENTFD2, initval, flags)

proc execve*(filename: cstring, argv: ptr ptr cstring, envp: ptr ptr cstring): cint32 =
  return syscall(EXECVE, filename, argv, envp)

proc execveat*(dirfd: cint32, pathname: cstring, argv: ptr ptr cstring, envp: ptr ptr cstring, flags: cint32): cint32 =
  return syscall(EXECVEAT, dirfd, pathname, argv, envp, flags)

proc exit*(status: cint32): cint32 =
  return syscall(EXIT, status)

proc exit_group*(status: cint32): cint32 =
  return syscall(EXIT_GROUP, status)

proc faccessat*(dirfd: cint32, pathname: cstring, mode: cint32, flags: cint32): cint32 =
  return syscall(FACCESSAT, dirfd, pathname, mode, flags)

proc faccessat2*(dirfd: cint32, pathname: cstring, mode: cint32, flags: cint32): cint32 =
  return syscall(FACCESSAT2, dirfd, pathname, mode, flags)

proc fallocate*(fd: cint32, mode: cint32, offset: off_t, len: off_t): cint32 =
  return syscall(FALLOCATE, fd, mode, offset, len)

proc fanotify_init*(flags: cuint32, event_f_flags: cuint32): cint32 =
  return syscall(FANOTIFY_INIT, flags, event_f_flags)

proc fanotify_mark*(fanotify_fd: cint32, flags: cuint32, mask: cuint64, dirfd: cint32, pathname: cstring): cint32 =
  return syscall(FANOTIFY_MARK, fanotify_fd, flags, mask, dirfd, pathname)

proc fchdir*(fd: cint32): cint32 =
  return syscall(FCHDIR, fd)

proc fchmod*(fd: cint32, mode: mode_t): cint32 =
  return syscall(FCHMOD, fd, mode)

proc fchmodat*(dirfd: cint32, pathname: cstring, mode: mode_t): cint32 =
  return syscall(FCHMODAT, dirfd, pathname, mode)

proc fchmodat2*(dirfd: cint32, pathname: cstring, mode: mode_t, flags: cint32): cint32 =
  return syscall(FCHMODAT2, dirfd, pathname, mode, flags)

proc fchown*(fd: cint32, owner: uid_t, group: gid_t): cint32 =
  return syscall(FCHOWN, fd, owner, group)

proc fchownat*(dirfd: cint32, pathname: cstring, owner: uid_t, group: gid_t, flags: cint32): cint32 =
  return syscall(FCHOWNAT, dirfd, pathname, owner, group, flags)

proc fdatasync*(fd: cint32): cint32 =
  return syscall(FDATASYNC, fd)

proc fgetxattr*(fd: cint32, name: cstring, value: pointer, size: csize_t): cint32 =
  return syscall(FGETXATTR, fd, name, value, size)

proc finit_module*(fd: cint32, param_values: cstring, flags: cint32): cint32 =
  return syscall(FINIT_MODULE, fd, param_values, flags)

proc flistxattr*(fd: cint32, list: ptr cchar, size: csize_t): cint32 =
  return syscall(FLISTXATTR, fd, list, size)

proc flock*(fd: cint32, operation: cint32): cint32 =
  return syscall(FLOCK, fd, operation)

proc fremovexattr*(fd: cint32, name: cstring): cint32 =
  return syscall(FREMOVEXATTR, fd, name)

proc fsconfig*(fsfd: cint32, cmd: cuint32, key: cstring, value: cstring, aux: cint32): cint32 =
  return syscall(FSCONFIG, fsfd, cmd, key, value, aux)

proc fsetxattr*(fd: cint32, name: cstring, value: pointer, size: csize_t, flags: cint32): cint32 =
  return syscall(FSETXATTR, fd, name, value, size, flags)

proc fsmount*(mount_fd: cint32, flags: cuint32): cint32 =
  return syscall(FSMOUNT, mount_fd, flags)

proc fsopen*(fd_name: cstring, flags: cuint32): cint32 =
  return syscall(FSOPEN, fd_name, flags)

proc fspick*(dirfd: cint32, pathname: cstring, flags: cuint32): cint32 =
  return syscall(FSPICK, dirfd, pathname, flags)

proc fsync*(fd: cint32): cint32 =
  return syscall(FSYNC, fd)

proc futex*(uaddr: ptr cint32, op: cint32, val: cint32, timeout: ptr Timespec, uaddr2: ptr cint32, val3: cint32): cint32 =
  return syscall(FUTEX, uaddr, op, val, timeout, uaddr2, val3)

proc futex_requeue*(uaddr: ptr cint32, wake_count: cuint32, requeue_count: cuint32, flags: cuint32): cint32 =
  return syscall(syscall_h.FUTEX_REQUEUE, uaddr, wake_count, requeue_count, flags)

proc futex_wait*(uaddr: ptr cint32, val: cuint32, flags: cuint32, timeout: ptr Timespec): cint32 =
  return syscall(syscall_h.FUTEX_WAIT, uaddr, val, flags, timeout)

proc futex_waitv*(waiters: ptr Futex_Waitv, nr_futexes: cuint32, flags: cuint32, timo: ptr Kernel_Timespec): cint32 =
  return syscall(FUTEX_WAITV, waiters, nr_futexes, flags, timo)

proc futex_wake*(uaddr: pointer, op: cint32, val: cint32, uaddr2: pointer, val2: cint32): cint32 =
  return syscall(syscall_h.FUTEX_WAKE, uaddr, op, val, uaddr2, val2)

proc get_mempolicy*(mode: ptr cint32, nodemask: ptr cuint64, maxnode: cuint64, address: pointer, flags: cuint64): cint32 =
  return syscall(GET_MEMPOLICY, mode, nodemask, maxnode, address, flags)

proc get_robust_list*(pid: cint32, head_ptr: ptr ptr Robust_list_header, len_ptr: ptr csize_t): cint32 =
  return syscall(GET_ROBUST_LIST, pid, head_ptr, len_ptr)

proc getcpu*(cpu: ptr cuint32, node: ptr cuint32, unused: pointer): cint32 =
  return syscall(GETCPU, cpu, node, unused)

proc getcwd*(buf: ptr char, size: csize_t): cint32 =
  return syscall(GETCWD, buf, size)

proc getdents64*(fd: cuint32, dirp: ptr Linux_Dirent64, count: cuint32): cint32 =
  return syscall(GETDENTS64, fd, dirp, count)

proc getegid*(): cint32 =
  return syscall(GETEGID)

proc geteuid*(): cint32 =
  return syscall(GETEUID)

proc getgid*(): cint32 =
  return syscall(GETGID)

proc getgroups*(size: cint32, list: ptr gid_t): cint32 =
  return syscall(GETGROUPS, size, list)

proc getitimer*(which: cint32, curr_value: ptr Itimeval): cint32 =
  return syscall(GETITIMER, which, curr_value)

proc getpeername*(sockfd: cint32, address: ptr Sockaddr, addrlen: ptr socklen_t): cint32 =
  return syscall(GETPEERNAME, sockfd, address, addrlen)

proc getpgid*(pid: pid_t): cint32 =
  return syscall(GETPGID, pid)

proc getpid*(): cint32 =
  return syscall(GETPID)

proc getppid*(): cint32 =
  return syscall(GETPPID)

proc getpriority*(which: cint32): cint32 =
  return syscall(GETPRIORITY, which)

proc getrandom*(buf: pointer, buflen: csize_t, flags: cuint32): cint32 =
  return syscall(GETRANDOM, buf, buflen, flags)

proc getresgid*(rgid: ptr gid_t, egid: ptr gid_t, sgid: ptr gid_t): cint32 =
  return syscall(GETRESGID, rgid, egid, sgid)

proc getresuid*(ruid: ptr uid_t, euid: ptr uid_t, suid: ptr uid_t): cint32 =
  return syscall(GETRESUID, ruid, euid, suid)

proc getrlimit*(resource: cint32, rlim: ptr Rlimit): cint32 =
  return syscall(GETRLIMIT, resource, rlim)

proc getrusage*(who: cint32, rusage: ptr Rusage): cint32 =
  return syscall(GETRUSAGE, who, rusage)

proc write*(fd: cint32, buf: pointer, count: csize_t): cint32 =
  return syscall(WRITE, fd, buf, count)

var fd: cint32 = 1
var str: array[5, cchar] = ['h', 'e', 'l', 'l', 'o']
var addrless: pointer = addr(str)
var count: csize_t = sizeof(str).csize_t
discard write(fd, addrless, count)
