import type_h

# fanotify_init's flags

const
  FAN_CLOEXEC*               : cuint32 = 0x00000001
  FAN_NONBLOCK*              : cuint32 = 0x00000002

  FAN_CLASS_NOTIF*           : cuint32 = 0x00000000
  FAN_CLASS_CONTENT*         : cuint32 = 0x00000004
  FAN_CLASS_PRE_CONTENT*     : cuint32 = 0x00000008

  FAN_UNLIMITED_QUEUE*       : cuint32 = 0x00000010
  FAN_UNLIMITED_MARKS*       : cuint32 = 0x00000020
  FAN_ENABLE_AUDIT*          : cuint32 = 0x00000040

  FAN_REPORT_PIDFD*          : cuint32 = 0x00000080
  FAN_REPORT_TID*            : cuint32 = 0x00000100
  FAN_REPORT_FID*            : cuint32 = 0x00000200
  FAN_REPORT_DIR_FID*        : cuint32 = 0x00000400
  FAN_REPORT_NAME*           : cuint32 = 0x00000800
  FAN_REPORT_TARGET_FID*     : cuint32 = 0x00001000
  FAN_REPORT_FD_ERROR*       : cuint32 = 0x00002000
  FAN_REPORT_MNT*            : cuint32 = 0x00004000

# fanotify_mark's flags

const
  FAN_MARK_ADD*              : cuint32 = 0x00000001
  FAN_MARK_REMOVE*           : cuint32 = 0x00000002
  FAN_MARK_DONT_FOLLOW*      : cuint32 = 0x00000004
  FAN_MARK_ONLYDIR*          : cuint32 = 0x00000008
  FAN_MARK_IGNORED_MASK*     : cuint32 = 0x00000020
  FAN_MARK_IGNORED_SURV_MODIFY* : cuint32 = 0x00000040
  FAN_MARK_FLUSH*            : cuint32 = 0x00000080
  FAN_MARK_EVICTABLE*        : cuint32 = 0x00000200
  FAN_MARK_IGNORE*           : cuint32 = 0x00000400

  FAN_MARK_INODE*            : cuint32 = 0x00000000
  FAN_MARK_MOUNT*            : cuint32 = 0x00000010
  FAN_MARK_FILESYSTEM*       : cuint32 = 0x00000100
  FAN_MARK_MNTNS*            : cuint32 = 0x00000110

# fanotify_mark's mask

const
  FAN_ACCESS*                : cuint32 = 0x00000001
  FAN_MODIFY*                : cuint32 = 0x00000002
  FAN_ATTRIB*                : cuint32 = 0x00000004
  FAN_CLOSE_WRITE*           : cuint32 = 0x00000008
  FAN_CLOSE_NOWRITE*         : cuint32 = 0x00000010
  FAN_OPEN*                  : cuint32 = 0x00000020
  FAN_MOVED_FROM*            : cuint32 = 0x00000040
  FAN_MOVED_TO*              : cuint32 = 0x00000080
  FAN_CREATE*                : cuint32 = 0x00000100
  FAN_DELETE*                : cuint32 = 0x00000200
  FAN_DELETE_SELF*           : cuint32 = 0x00000400
  FAN_MOVE_SELF*             : cuint32 = 0x00000800
  FAN_OPEN_EXEC*             : cuint32 = 0x00001000

  FAN_OPEN_PERM*             : cuint32 = 0x00010000
  FAN_ACCESS_PERM*           : cuint32 = 0x00020000
  FAN_OPEN_EXEC_PERM*        : cuint32 = 0x00040000

  FAN_EVENT_ON_CHILD*        : cuint32 = 0x08000000
  FAN_RENAME*                : cuint32 = 0x10000000
  FAN_ONDIR*                 : cuint32 = 0x40000000