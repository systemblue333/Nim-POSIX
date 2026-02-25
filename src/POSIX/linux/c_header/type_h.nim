const
  SIGSET_NWORDS*: int = 16

type
  cint64* = clong
  cint32* = cint
  cint16* = cshort
  cint8* = cchar
  cuint64* = culong
  cuint32* = cuint
  cuint16* = cushort
  cuint8* = cuchar

  size_t* = uint32

  off_t* = clong

  mode_t* = cuint32

  key_serial_t* = cint32

  Sigset_t* {.packed.} = object
    val*: array[SIGSET_NWORDS, cuint64]

  Linux_Dirent64* {.packed.} = object
    dIno*: cuint64
    dOff*: cint64
    dReclen*: cuint64
    dType*: cuint8
    dName*: UnCheckedArray[cchar]