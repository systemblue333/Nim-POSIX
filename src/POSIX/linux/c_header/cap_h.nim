import type_h

type
  User_Cap_Header_Struct* {.packed.} = object
    version*: cuint32
    pid*: cint32

  User_Cap_Data_Struct* {.packed.} = object
    effective*: cuint32
    permitted*: cuint32
    inheritable*: cuint32