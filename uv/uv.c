#include <stdlib.h>
#include "uv.h"

void* c_alloc(size_t size) { return calloc(sizeof(char), size); }

size_t sizeof_uv_once_t()   { return sizeof(uv_once_t   ); }
size_t sizeof_uv_thread_t() { return sizeof(uv_thread_t ); }
size_t sizeof_uv_mutex_t()  { return sizeof(uv_mutex_t  ); }
size_t sizeof_uv_rwlock_t() { return sizeof(uv_rwlock_t ); }
size_t sizeof_uv_sem_t()    { return sizeof(uv_sem_t    ); }
size_t sizeof_uv_cond_t()   { return sizeof(uv_cond_t   ); }
size_t sizeof_uv_key_t()    { return sizeof(uv_key_t    ); }

size_t sizeof_uv_req_t()         { return sizeof(sizeof_uv_req_t         ); }
size_t sizeof_uv_getaddrinfo_t() { return sizeof(sizeof_uv_getaddrinfo_t ); }
size_t sizeof_uv_getnameinfo_t() { return sizeof(sizeof_uv_getnameinfo_t ); }
size_t sizeof_uv_shutdown_t()    { return sizeof(sizeof_uv_shutdown_t    ); }
size_t sizeof_uv_write_t()       { return sizeof(sizeof_uv_write_t       ); }
size_t sizeof_uv_connect_t()     { return sizeof(sizeof_uv_connect_t     ); }
size_t sizeof_uv_udp_send_t()    { return sizeof(sizeof_uv_udp_send_t    ); }
size_t sizeof_uv_fs_t()          { return sizeof(sizeof_uv_fs_t          ); }
size_t sizeof_uv_work_t()        { return sizeof(sizeof_uv_work_t        ); }
size_t sizeof_uv_random_t()      { return sizeof(sizeof_uv_random_t      ); }

size_t sizeof_uv_loop_t()     { return sizeof(uv_loop_t     ); }
size_t sizeof_uv_handle_t()   { return sizeof(uv_handle_t   ); }
size_t sizeof_uv_dir_t()      { return sizeof(uv_dir_t      ); }
size_t sizeof_uv_stream_t()   { return sizeof(uv_stream_t   ); }
size_t sizeof_uv_tcp_t()      { return sizeof(uv_tcp_t      ); }
size_t sizeof_uv_udp_t()      { return sizeof(uv_udp_t      ); }
size_t sizeof_uv_pipe_t()     { return sizeof(uv_pipe_t     ); }
size_t sizeof_uv_tty_t()      { return sizeof(uv_tty_t      ); }
size_t sizeof_uv_poll_t()     { return sizeof(uv_poll_t     ); }
size_t sizeof_uv_timer_t()    { return sizeof(uv_timer_t    ); }
size_t sizeof_uv_prepare_t()  { return sizeof(uv_prepare_t  ); }
size_t sizeof_uv_check_t()    { return sizeof(uv_check_t    ); }
size_t sizeof_uv_idle_t()     { return sizeof(uv_idle_t     ); }
size_t sizeof_uv_async_t()    { return sizeof(uv_async_t    ); }
size_t sizeof_uv_process_t()  { return sizeof(uv_process_t  ); }
size_t sizeof_uv_fs_event_t() { return sizeof(uv_fs_event_t ); }
size_t sizeof_uv_fs_poll_t()  { return sizeof(uv_fs_poll_t  ); }
size_t sizeof_uv_signal_t()   { return sizeof(uv_signal_t   ); }
