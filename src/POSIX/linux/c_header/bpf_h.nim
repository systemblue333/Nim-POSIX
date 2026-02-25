import type_h

const
  BPF_OBJ_NAME_LEN*: int = 16

const
  BPF_MAP_TYPE_UNSPEC*: cuint32 = 0
  BPF_MAP_TYPE_HASH*: cuint32 = 1
  BPF_MAP_TYPE_ARRAY*: cuint32 = 2
  BPF_MAP_TYPE_PROG_ARRAY*: cuint32 = 3
  BPF_MAP_TYPE_PERF_EVENT_ARRAY*: cuint32 = 4
  BPF_MAP_TYPE_PERCPU_HASH*: cuint32 = 5
  BPF_MAP_TYPE_PERCPU_ARRAY*: cuint32 = 6
  BPF_MAP_TYPE_STACK_TRACE*: cuint32 = 7
  BPF_MAP_TYPE_CGROUP_ARRAY*: cuint32 = 8
  BPF_MAP_TYPE_LRU_HASH*: cuint32 = 9
  BPF_MAP_TYPE_LRU_PERCPU_HASH*: cuint32 = 10
  BPF_MAP_TYPE_LPM_TRIE*: cuint32 = 11
  BPF_MAP_TYPE_ARRAY_OF_MAPS*: cuint32 = 12
  BPF_MAP_TYPE_HASH_OF_MAPS*: cuint32 = 13
  BPF_MAP_TYPE_DEVMAP*: cuint32 = 14
  BPF_MAP_TYPE_SOCKMAP*: cuint32 = 15
  BPF_MAP_TYPE_CPUMAP*: cuint32 = 16
  BPF_MAP_TYPE_XSKMAP*: cuint32 = 17
  BPF_MAP_TYPE_SOCKHASH*: cuint32 = 18
  BPF_MAP_TYPE_CGROUP_STORAGE_DEPRECATED*: cuint32 = 19
  BPF_MAP_TYPE_CGROUP_STORAGE*: cuint32 = BPF_MAP_TYPE_CGROUP_STORAGE_DEPRECATED
  BPF_MAP_TYPE_REUSEPORT_SOCKARRAY*: cuint32 = 21

const
  BPF_MAP_CREATE*: cint32 = 0
  BPF_MAP_LOOKUP_ELEM*: cint32 = 1
  BPF_MAP_UPDATE_ELEM*: cint32 = 2
  BPF_MAP_DELETE_ELEM*: cint32 = 3
  BPF_MAP_GET_NEXT_KEY*: cint32 = 4
  BPF_PROG_LOAD*: cint32 = 5
  BPF_OBJ_PIN*: cint32 = 6
  BPF_OBJ_GET*: cint32 = 7
  BPF_PROG_ATTACH*: cint32 = 8
  BPF_PROG_DETACH*: cint32 = 9
  BPF_PROG_TEST_RUN*: cint32 = 10
  BPF_PROG_RUN*: cint32 = 10
  BPF_PROG_GET_NEXT_ID*: cint32 = 12
  BPF_MAP_GET_NEXT_ID*: cint32 = 13
  BPF_PROG_GET_FD_BY_ID*: cint32 = 14
  BPF_MAP_GET_FD_BY_ID*: cint32 = 15
  BPF_OBJ_GET_INFO_BY_FD*: cint32 = 16
  BPF_PROG_QUERY*: cint32 = 17
  BPF_RAW_TRACEPOINT_OPEN*: cint32 = 18
  BPF_BTF_LOAD*: cint32 = 19
  BPF_BTF_GET_FD_BY_ID*: cint32 = 20
  BPF_TASK_FD_QUERY*: cint32 = 21
  BPF_MAP_LOOKUP_AND_DELETE_ELEM*: cint32 = 22
  BPF_MAP_FREEZE*: cint32 = 23
  BPF_BTF_GET_NEXT_ID*: cint32 = 24
  BPF_MAP_LOOKUP_BATCH*: cint32 = 25
  BPF_MAP_LOOKUP_AND_DELETE_BATCH*: cint32 = 26
  BPF_MAP_UPDATE_BATCH*: cint32 = 27
  BPF_MAP_DELETE_BATCH*: cint32 = 28
  BPF_LINK_CREATE*: cint32 = 29
  BPF_LINK_UPDATE*: cint32 = 30
  BPF_LINK_GET_FD_BY_ID*: cint32 = 31
  BPF_LINK_GET_NEXT_ID*: cint32 = 32
  BPF_ENABLE_STATS*: cint32 = 33
  BPF_ITER_CREATE*: cint32 = 34
  BPF_LINK_DETACH*: cint32 = 35
  BPF_PROG_BIND_MAP*: cint32 = 36
  BPF_TOKEN_CREATE*: cint32 = 37
  MAX_BPF_CMD*: cint32 = 38 ## Never use this cmd

type
  Bpf_Map_Create_Obj* = object
    map_type*: cuint32 # one of bpf_map_type
    key_size*: cuint32 # size of key in bytes
    value_size*: cuint32 # size of value in bytes
    max_entries*: cuint32 # max number of entries in a map
    map_flags*: cuint32 # BPF_MAP_CREATE related
    inner_map_fd*: cuint32 # fd pointing to the inner map
    numa_node*: cuint32
    map_name*: array[BPF_OBJ_NAME_LEN, cchar]
    map_ifindex*: cuint32
    btf_fd*: cuint32
    btf_key_type_id*: cuint32
    btf_value_type_id*: cuint32
    btf_vmlinux_value_type_id*: cuint32
    map_extra*: cuint64
    value_type_btf_obj_fd*: cint32
    map_token_fd*: cint32

  Bpf_KeyValue_Union* = object
    value* {.align: 8.} : cuint64
    next_key* {.align: 8.} : cuint64

  Bpf_Map_Elem_And_Freeze* = object
    map_fd*: cuint
    key* {.align: 8.} : cuint64
    bpf_keyvalue_union*: Bpf_KeyValue_Union
    flags*: cuint64

  Bpf_Map_Batch* = object
    in_batch* {.align: 8.} : cuint64
    out_batch* {.align: 8.} : cuint64
    keys* {.align: 8.} : cuint64
    value* {.align: 8.} : cuint64
    count*: cuint32
    map_fd*: cuint32
    elem_flags*: cuint64
    flags*: cuint64

  Bpf_Prog_Load_Obj* = object
    prog_type*: cuint32 # one of bpf_prog_type
    insn_cnt*: cuint32
    insns* {.align: 8.} : cuint64
    license* {.align: 8.} : cuint64
    log_level*: cuint32 # verbosity level of verifier
    log_size*: cuint32 # size of user buffer
    log_buf* {.align: 8.} : cuint64 # user supplied buffer
    kern_version*: cuint32 # not use

  Bpf_Attr* = object
    bpf_map_create_obj*: Bpf_Map_Create_Obj
    bpf_map_elem_and_freeze: Bpf_Map_Elem_And_Freeze
    bpf_map_batch*: Bpf_Map_Batch
    bpf_prog_load_obj*: Bpf_Prog_Load_Obj