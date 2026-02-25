import type_h

# delete_module header

const
  O_NONBLOCK*: cuint32 = 0x800
  O_TURNC*: cuint32 = 0x200
  O_TRUNCff*: cuint32 = 0x200

# dup3 header

const
  O_CLOEXEC*: cuint32 = 0x80000

# finit_module header

const
  MODULE_INIT_IGNORE_VERMAGIC*: cint32 = 1
  MODULE_INIT_IGNORE_MODVERSIONS*: cint32 = 2

# flock header

const
  LOCK_SH*: cint32 = 1 # share lock
  LOCK_EX*: cint32 = 2 # non share lock
  LOCK_UN*: cint32 = 8 # unlock
  LOCK_NB*: cint32 = 4 # non blocking lock

# fsconfig header

const
  FSCONFIG_SET_FLAG*: cuint32 = 0  # set key to flag (no value)
  FSCONFIG_SET_STRING*: cuint32 = 1  # set key to string value
  FSCONFIG_SET_BINARY*: cuint32 = 2  # set key to binary value
  FSCONFIG_SET_PATH*: cuint32 = 3  # set key to path value
  FSCONFIG_SET_PATH_EMPTY*: cuint32 = 4  # set key to empty path
  FSCONFIG_SET_FD*: cuint32 = 5  # set key to file descriptor
  FSCONFIG_CMD_CREATE*: cuint32 = 6  # finalize and create filesystem
  FSCONFIG_CMD_RECONFIGURE*: cuint32 = 7  # reconfigure existing filesystem

# fsetxattr header

const
  XATTR_CREATE*: cint32 = 1 # generate only if attribution do not exist
  XATTR_REPLACE*: cint32 = 2 # replace only if attribution exists

# fsmount header

const
  FSMOUNT_CLOEXEC*: cuint32 = 0x00000001
  FSMOUNT_READONLY*: cuint32 = 0x00000002

# fspick header

const
  FSPICK_CLOEXEC*: cuint32 = 0x00000001
  FSPICK_SYMLINK_NOFOLLOW*: cuint32 = 0x00000002
  FSPICK_NO_AUTOMOUNT*: cuint32 = 0x00000004

# get_mempolicy header

const
  MPOL_F_NODE*: cuint64 = 0x01
  MPOL_F_ADDR*: cuint64 = 0x02
  MPOL_F_MEMS_ALLOWED*: cuint64 = 0x04