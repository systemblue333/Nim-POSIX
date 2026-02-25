import type_h

type
  socklen_t* = cuint32

  sa_family_t* = cushort

  Sockaddr* {.packed.} = object
    sa_family*: sa_family_t
    sa_data*: array[14, char]