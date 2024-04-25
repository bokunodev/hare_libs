use types::c::{char, ssize};

export type uv_errno_t = enum {
	UV_E2BIG           = (-4093),
	UV_EACCES          = (-4092),
	UV_EADDRINUSE      = (-4091),
	UV_EADDRNOTAVAIL   = (-4090),
	UV_EAFNOSUPPORT    = (-4089),
	UV_EAGAIN          = (-4088),
	UV_EAI_ADDRFAMILY  = (-3000),
	UV_EAI_AGAIN       = (-3001),
	UV_EAI_BADFLAGS    = (-3002),
	UV_EAI_BADHINTS    = (-3013),
	UV_EAI_CANCELED    = (-3003),
	UV_EAI_FAIL        = (-3004),
	UV_EAI_FAMILY      = (-3005),
	UV_EAI_MEMORY      = (-3006),
	UV_EAI_NODATA      = (-3007),
	UV_EAI_NONAME      = (-3008),
	UV_EAI_OVERFLOW    = (-3009),
	UV_EAI_PROTOCOL    = (-3014),
	UV_EAI_SERVICE     = (-3010),
	UV_EAI_SOCKTYPE    = (-3011),
	UV_EALREADY        = (-4084),
	UV_EBADF           = (-4083),
	UV_EBUSY           = (-4082),
	UV_ECANCELED       = (-4081),
	UV_ECHARSET        = (-4080),
	UV_ECONNABORTED    = (-4079),
	UV_ECONNREFUSED    = (-4078),
	UV_ECONNRESET      = (-4077),
	UV_EDESTADDRREQ    = (-4076),
	UV_EEXIST          = (-4075),
	UV_EFAULT          = (-4074),
	UV_EFBIG           = (-4036),
	UV_EHOSTUNREACH    = (-4073),
	UV_EINTR           = (-4072),
	UV_EINVAL          = (-4071),
	UV_EIO             = (-4070),
	UV_EISCONN         = (-4069),
	UV_EISDIR          = (-4068),
	UV_ELOOP           = (-4067),
	UV_EMFILE          = (-4066),
	UV_EMSGSIZE        = (-4065),
	UV_ENAMETOOLONG    = (-4064),
	UV_ENETDOWN        = (-4063),
	UV_ENETUNREACH     = (-4062),
	UV_ENFILE          = (-4061),
	UV_ENOBUFS         = (-4060),
	UV_ENODEV          = (-4059),
	UV_ENOENT          = (-4058),
	UV_ENOMEM          = (-4057),
	UV_ENONET          = (-4056),
	UV_ENOPROTOOPT     = (-4035),
	UV_ENOSPC          = (-4055),
	UV_ENOSYS          = (-4054),
	UV_ENOTCONN        = (-4053),
	UV_ENOTDIR         = (-4052),
	UV_ENOTEMPTY       = (-4051),
	UV_ENOTSOCK        = (-4050),
	UV_ENOTSUP         = (-4049),
	UV_EOVERFLOW       = (-4026),
	UV_EPERM           = (-4048),
	UV_EPIPE           = (-4047),
	UV_EPROTO          = (-4046),
	UV_EPROTONOSUPPORT = (-4045),
	UV_EPROTOTYPE      = (-4044),
	UV_ERANGE          = (-4034),
	UV_EROFS           = (-4043),
	UV_ESHUTDOWN       = (-4042),
	UV_ESPIPE          = (-4041),
	UV_ESRCH           = (-4040),
	UV_ETIMEDOUT       = (-4039),
	UV_ETXTBSY         = (-4038),
	UV_EXDEV           = (-4037),
	UV_UNKNOWN         = (-4094),
	UV_EOF             = (-4095),
	UV_ENXIO           = (-4033),
	UV_EMLINK          = (-4032),
	UV_EHOSTDOWN       = (-4031),
	UV_EREMOTEIO       = (-4030),
	UV_ENOTTY          = (-4029),
	UV_EFTYPE          = (-4028),
	UV_EILSEQ          = (-4027),
	UV_ESOCKTNOSUPPORT = (-4025),
	UV_ENODATA         = (-4024),
	UV_EUNATCH         = (-4023),
	UV_ERRNO_MAX       = (-4095) - 1,
};

export type uv_handle_type = enum {
	UV_UNKNOWN_HANDLE = 0,
	UV_ASYNC,
	UV_CHECK,
	UV_FS_EVENT,
	UV_FS_POLL,
	UV_HANDLE,
	UV_IDLE,
	UV_NAMED_PIPE,
	UV_POLL,
	UV_PREPARE,
	UV_PROCESS,
	UV_STREAM,
	UV_TCP,
	UV_TIMER,
	UV_TTY,
	UV_UDP,
	UV_SIGNAL,
	UV_FILE,
	UV_HANDLE_TYPE_MAX,
};

export type uv_req_type = enum {
	UV_UNKNOWN_REQ = 0,
	UV_REQ,
	UV_CONNECT,
	UV_WRITE,
	UV_SHUTDOWN,
	UV_UDP_SEND,
	UV_FS,
	UV_WORK,
	UV_GETADDRINFO,
	UV_GETNAMEINFO,
	UV_RANDOM,
	UV_REQ_TYPE_PRIVATE,
	UV_REQ_TYPE_MAX,
};

export type uv_file = int;

export type uv__work = struct {
	work: *fn(w: *uv__work) void,
	done: *fn(w: *uv__work, status: int) void,
	loop: *uv_loop_t,
	wq:   uv__queue,
};

export type uv__queue = struct {
	next: *uv__queue,
	prev: *uv__queue,
};

export type uv_loop_t = struct {
	data:           *opaque,
	active_handles: uint,
	handle_queue:   uv__queue,
	active_reqs: union {
		unused: *opaque,
		count:  uint,
	},
	internal_fields:  *opaque,
	stop_flag:        uint,
	flags:            u64,
	backend_fd:       int,
	pending_queue:    uv__queue,
	watcher_queue:    uv__queue,
	watchers:         **uv__io_t,
	nwatchers:        uint,
	nfds:             uint,
	wq:               uv__queue,
	wq_mutex:         uv_mutex_t,
	wq_async:         uv_async_t,
	cloexec_lock:     uv_rwlock_t,
	closing_handles:  *uv_handle_t,
	process_handles:  uv__queue,
	prepare_handles:  uv__queue,
	check_handles:    uv__queue,
	idle_handles:     uv__queue,
	async_handles:    uv__queue,
	async_unused:     *fn() void,
	async_io_watcher: uv__io_t,
	async_wfd:        int,
	timer_heap: struct {
		min:   *opaque,
		nelts: uint,
	},
	timer_counter:        u64,
	time:                 u64,
	signal_pipefd:        [2]int,
	signal_io_watcher:    uv__io_t,
	child_watcher:        uv_signal_t,
	emfile_fd:            int,
	inotify_read_watcher: uv__io_t,
	inotify_watchers:     *opaque,
	inotify_fd:           int,
};

export type uv_handle_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     uv_close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing: *uv_handle_t,
	flags:        uint,
};

export type DIR = opaque;
export type uv__io_t = opaque;

export type uv_dir_t = struct {
	dirents:  *uv_dirent_t,
	nentries: size,
	reserved: [4]*opaque,
	dir:      *DIR,
};

export type uv_stream_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing:          *uv_handle_t,
	flags:                 uint,
	write_queue_size:      size,
	alloc_cb:              alloc_cb,
	read_cb:               read_cb,
	connect_req:           *uv_connect_t,
	shutdown_req:          *uv_shutdown_t,
	io_watcher:            uv__io_t,
	write_queue:           uv__queue,
	write_completed_queue: uv__queue,
	connection_cb:         connection_cb,
	delayed_error:         int,
	accepted_fd:           int,
	queued_fds:            *opaque,
};

export type uv_tcp_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int;
		reserved: [4]*opaque;
	},
	next_closing:          *uv_handle_t,
	flags:                 uint,
	write_queue_size:      size,
	alloc_cb:              alloc_cb,
	read_cb:               read_cb,
	connect_req:           *uv_connect_t,
	shutdown_req:          *uv_shutdown_t,
	io_watcher:            uv__io_t,
	write_queue:           uv__queue,
	write_completed_queue: uv__queue,
	connection_cb:         connection_cb,
	delayed_error:         int,
	accepted_fd:           int,
	queued_fds:            *opaque,
  };

export type uv_udp_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int;
		reserved: [4]*opaque;
	},
	next_closing:          *uv_handle_t;
	flags:                 uint;
	send_queue_size:       size,
	send_queue_count:      size,
	alloc_cb:              alloc_cb,
	recv_cb:               udp_recv_cb,
	io_watcher:            uv__io_t,
	write_queue:           uv__queue,
	write_completed_queue: uv__queue,
  };

export type uv_pipe_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing:          *uv_handle_t,
	flags:                 uint,
	write_queue_size:      size,
	alloc_cb:              alloc_cb,
	read_cb:               read_cb,
	connect_req:           *uv_connect_t,
	shutdown_req:          *uv_shutdown_t,
	io_watcher:            uv__io_t,
	write_queue:           uv__queue,
	write_completed_queue: uv__queue,
	connection_cb:         connection_cb,
	delayed_error:         int,
	accepted_fd:           int,
	queued_fds:            *opaque,
	ipc:                   int,
	pipe_fname:            const*char,
};

export type uv_tty_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing:          *uv_handle_t,
	flags:                 uint,
	write_queue_size:      size,
	alloc_cb:              alloc_cb,
	read_cb:               read_cb,
	connect_req:           *uv_connect_t,
	shutdown_req:          *uv_shutdown_t,
	io_watcher:            uv__io_t,
	write_queue:           uv__queue,
	write_completed_queue: uv__queue,
	connection_cb:         connection_cb,
	delayed_error:         int,
	accepted_fd:           int,
	queued_fds:            *opaque,
	orig_termios:          termios,
	mode:                  int,
};

export type uv_poll_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	poll_cb:      poll_cb,
	io_watcher:   uv__io_t,
};

export type uv_timer_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: *opaque[4],
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	timer_cb:     timer_cb,
	node: union {
		heap:  [3]*opaque,
		queue: uv__queue,
	},
	timeout:  u64,
	repeat:   u64,
	start_id: u64,
};

export type uv_prepare_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	prepare_cb:   prepare_cb,
	queue:        uv__queue,
};

export type uv_check_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	check_cb:     check_cb,
	queue:        uv__queue,
};

export type uv_idle_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int;
		reserved: [4]*opaque;
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	idle_cb:      idle_cb,
	queue:        uv__queue,
};

export type uv_async_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: *opaque[4],
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	async_cb:     async_cb,
	queue:        uv__queue,
	pending:      int,
};

export type uv_process_t  = struct {
	data:         *opaque;
	loop:         *uv_loop_t;
	_type:        uv_handle_type;
	close_cb:     close_cb;
	handle_queue: uv__queue;
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	exit_cb:      exit_cb,
	pid:          int,
	queue:        uv__queue,
	status:       int,
};

export type uv_fs_event_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	path:         *char,
	cb:           fs_event_cb,
	watchers:     uv__queue,
	wd:           int,
};

export type uv_fs_poll_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int;
		reserved: [4]*opaque;
	},
	next_closing: *uv_handle_t,
	flags:        uint,
	poll_ctx:     *opaque,
};

export type uv_signal_t = struct {
	data:         *opaque,
	loop:         *uv_loop_t,
	_type:        uv_handle_type,
	close_cb:     close_cb,
	handle_queue: uv__queue,
	u: union {
		fd:       int,
		reserved: [4]*opaque,
	},
	next_closing: *uv_handle_t;
	flags:        uint;
	signal_cb:    signal_cb;
	signum:       int;
	tree_entry:   struct {
		rbe_left:   *uv_signal_s,
		rbe_right:  *uv_signal_s,
		rbe_parent: *uv_signal_s,
		rbe_color:  int,
	},
	caught_signals:     uint,
	dispatched_signals: uint,
};

export type uv_req_t = struct {
	data:     *opaque,
	_type:    uv_req_type,
	reserved: [6]*opaque,
};

export type uv_getaddrinfo_t = struct {
	data:     *opaque,
	_type:    uv_req_type,
	reserved: [6]*opaque,
	loop:     *uv_loop_t,
	work_req: uv__work,
	cb:       getaddrinfo_cb,
	hints:    *addrinfo,
	hostname: *char,
	service:  *char,
	addrinfo: *addrinfo,
	retcode:  int,
};

export type uv_getnameinfo_t = struct {
    data:           *opaque,
    _type:          uv_req_type,
    reserved:       [6]*opaque,
    loop:           *uv_loop_t,
    work_req:       uv__work,
    getnameinfo_cb: getnameinfo_cb,
    storage:        sockaddr_storage,
    flags:          int,
    host:           [1025]char,
    service:        [32]char,
    retcode:        int,
};

export type uv_shutdown_t = struct {
	data:     *opaque,
	_type:    uv_req_type,
	reserved: [6]*opaque,
	handle:   *uv_stream_t,
	cb:       shutdown_cb,
};

export type uv_write_t = struct {
	data:        *opaque,
	_type:       uv_req_type,
	reserved:    [6]*opaque,
	cb:          write_cb,
	send_handle: *uv_stream_t,
	handle:      *uv_stream_t,
	queue:       uv__queue,
	write_index: uint,
	bufs:        *uv_buf_t,
	nbufs:       uint,
	error:       int,
	bufsml:      [4]uv_buf_t,
};

export type uv_connect_t = struct {
	data:     *opaque,
	_type:    uv_req_type,
	reserved: [6]*opaque,
	cb:       connect_cb,
	handle:   *uv_stream_t,
	queue:    uv__queue,
};

export type uv_udp_send_t = struct {
	data:     *opaque,
	_type:    uv_req_type,
	reserved: [6]*opaque,
	handle:   *uv_udp_t,
	cb:       udp_send_cb,
	queue:    uv__queue,
	addr:     sockaddr_storage,
	nbufs:    uint,
	bufs:     *uv_buf_t,
	status:   ssize_t,
	send_cb:  udp_send_cb,
	bufsml:   [4]uv_buf_t,
};

export type uv_fs_t = struct {
	data:     *opaque,
	_type:    uv_req_type,
	reserved: [6]*opaque,
	fs_type:  uv_fs_type,
	loop:     *uv_loop_t,
	cb:       fs_cb,
	result:   ssize_t,
	ptr:      *opaque,
	path:     const*char,
	statbuf:  uv_stat_t,
	new_path: const*char,
	file:     uv_file,
	flags:    int,
	mode:     mode_t,
	nbufs:    uint,
	bufs:     uv_buf_t,
	off:      off_t,
	uid:      uv_uid_t,
	gid:      uv_gid_t,
	atime:    double,
	mtime:    double,
	work_req: uv__work,
	bufsml:   [4]uv_buf_t,
};

export type uv_work_t = struct {
  data:          *opaque,
  _type:         uv_req_type,
  reserved:      [6]*opaque,
  loop:          *uv_loop_t,
  work_cb:       work_cb,
  after_work_cb: after_work_cb,
  work_req:      uv__work,
};

export type uv_random_t = struct {
	data:     *opaque,
	_type:    uv_req_type,
	reserved: [6]*opaque,
	loop:     *uv_loop_t,
	status:   int,
	buf:      *opaque,
	buflen:   size,
	cb:       random_cb,
	work_req: uv__work,
};

export type uv_env_item_t = struct {
	name:  *char,
	value: *char,
};

export type uv_cpu_info_t = struct {
	model:     *char,
	speed:     int,
	cpu_times: uv_cpu_times_t,
};

export type uv_interface_address_t = struct {
	name:        *char,
	phys_addr:   [6]char,
	is_internal: int,
	address: union {
		address4: sockaddr_in,
		address6: sockaddr_in6,
	},
	netmask: union {
		netmask4: sockaddr_in,
		netmask6: sockaddr_in6,
	},
};

export type uv_dirent_t = struct {
	name:  const*char,
	_type: uv_dirent_type_t,
};

export type uv_passwd_t = struct {
	username: *char,
	uid:      u64,
	gid:      u64,
	shell:    *char,
	homedir:  *char,
};

export type uv_group_t = struct {
	groupname: *char,
	gid:       u64,
	members:   **char,
};

export type uv_utsname_t = struct {
	sysname: [256]char,
	release: [256]char,
	version: [256]char,
	machine: [256]char,
};

export type uv_statfs_t = struct {
	f_type:     u64,
	f_bsize:    u64,
	f_blocks:   u64,
	f_bfree:    u64,
	f_bavail:   u64,
	f_files:    u64,
	f_ffree:    u64,
	f_spare:    [4]u64,
};

export type uv_metrics_t = struct {
  loop_count:     u64,
  events:         u64,
  events_waiting: u64,
  reserved:       [13]*u64,
};

// uv_thread_t is an alias for pthread_t in uv/unix.h
export type uv_thread_t = struct {
	_padding: [8]u8,
};

export type uv_loop_option = enum {
	UV_LOOP_BLOCK_SIGNAL = 0,
	UV_METRICS_IDLE_TIME,
};

export type uv_run_mode = enum {
	UV_RUN_DEFAULT = 0,
	UV_RUN_ONCE,
	UV_RUN_NOWAIT,
};

export @symbol("uv_version")        fn version() uint;
export @symbol("uv_version_string") fn version_string() const*char;

export type malloc_fn  = *fn(_size: size) *opaque;
export type realloc_fn = *fn(ptr: *opaque, _size: size) *opaque;
export type calloc_fn  = *fn(count: size, _size: size) *opaque;
export type free_fn    = *fn(ptr: *opaque) void ;

export @symbol("uv_library_shutdown") fn library_shutdown() void;

export @symbol("uv_replace_allocator") fn replace_allocator(malloc_func: uv_malloc_fn, realloc_func: uv_realloc_fn, calloc_func: uv_calloc_fn, free_func: uv_free_fn) int;

export @symbol("uv_default_loop") fn default_loop() *uv_loop_t;
export @symbol("uv_loop_init")    fn loop_init(loop: *uv_loop_t) int;
export @symbol("uv_loop_close")   fn loop_close(loop: *uv_loop_t) int;

export @symbol("uv_loop_new") fn loop_new() *uv_loop_t;

export @symbol("uv_loop_delete")    fn loop_delete(loop: *uv_loop_t) void;
export @symbol("uv_loop_size")      fn loop_size() size;
export @symbol("uv_loop_alive")     fn loop_alive(loop: const*uv_loop_t) int;
export @symbol("uv_loop_configure") fn loop_configure(loop: *uv_loop_t, option: uv_loop_option...) int;
export @symbol("uv_loop_fork")      fn loop_fork(loop: *uv_loop_t) int;

export @symbol("uv_run")  fn run(loop: *uv_loop_t, mode: uv_run_mode) int;
export @symbol("uv_stop") fn stop(loop: *uv_loop_t) void;

export @symbol("uv_ref")     fn ref(handle: *uv_handle_t) void;
export @symbol("uv_unref")   fn unref(*uv_handle_t) void;
export @symbol("uv_has_ref") fn has_ref(handle: const*uv_handle_t) int;

export @symbol("uv_update_time") fn update_time(handle: *uv_loop_t) void;
export @symbol("uv_now")         fn now(handle: const*uv_loop_t) u64;

export @symbol("uv_backend_fd")      fn backend_fd(lopo: const*uv_loop_t) int;
export @symbol("uv_backend_timeout") fn backend_timeout(lopo: const*uv_loop_t) int;

export type alloc_cb       = *fn(handle: *uv_handle_t, suggested_size: size, buf: *uv_buf_t) void;
export type read_cb        = *fn(stream: *uv_stream_t, nread: ssize, buf: const*uv_buf_t) void;
export type write_cb       = *fn(req: *uv_write_t, status: int) void;
export type connect_cb     = *fn(req: *uv_connect_t, status: int) void;
export type shutdown_cb    = *fn(req: *uv_shutdown_t, status: int) void;
export type connection_cb  = *fn(server: *uv_stream_t, status: int) void;
export type close_cb       = *fn(handle: *uv_handle_t) void;
export type poll_cb        = *fn(handle: *uv_poll_t, status: int, events: int) void;
export type timer_cb       = *fn(handle: *uv_timer_t) void;
export type async_cb       = *fn(handle: *uv_async_t) void;
export type prepare_cb     = *fn(handle: *uv_prepare_t) void;
export type check_cb       = *fn(handle: *uv_check_t) void;
export type idle_cb        = *fn(handle: *uv_idle_t) void;
export type exit_cb        = *fn(process: *uv_process_t, exit_status: i64, term_signal: int) void;
export type walk_cb        = *fn(handle: *uv_handle_t, arg: *opaque) void;
export type fs_cb          = *fn(req: *uv_fs_t) void;
export type work_cb        = *fn(req: *uv_work_t) void;
export type after_work_cb  = *fn(req: *uv_work_t, status: int) void;
export type getaddrinfo_cb = *fn(req: *uv_getaddrinfo_t, status: int, res: *addrinfo) void;
export type getnameinfo_cb = *fn(req: *uv_getnameinfo_t, status: int, hostname: const*char, service: const*char) void;
export type random_cb      = *fn(req: *uv_random_t, status: int, buf: *opaque, buflen: size) void;

export type uv_clock_id = enum {
	UV_CLOCK_MONOTONIC,
	UV_CLOCK_REALTIME,
};

export type uv_timespec_t = struct {
	tv_sec:  u64,
	tv_nsec: u64,
};

export type uv_timespec64_t = struct {
	tv_sec:  i64,
	tv_nsec: i32,
};

export type uv_timeval_t = struct {
	tv_sec:  u64,
	tv_usec: u64,
};

export type uv_timeval64_t = struct {
	tv_sec:  i64,
	tv_usec: i32,
};

export type uv_stat_t = struct {
	st_dev:      u64,
	st_mode:     u64,
	st_nlink:    u64,
	st_uid:      u64,
	st_gid:      u64,
	st_rdev:     u64,
	st_ino:      u64,
	st_size:     u64,
	st_blksize:  u64,
	st_blocks:   u64,
	st_flags:    u64,
	st_gen:      u64,
	st_atim:     uv_timespec_t,
	st_mtim:     uv_timespec_t,
	st_ctim:     uv_timespec_t,
	st_birthtim: uv_timespec_t,
};

export type fs_event_cb = *fn(handle: *uv_fs_event_t, filename: const*char, events: int, status: int) void;
export type fs_poll_cb  = *fn(handle: *uv_fs_poll_t, status: int, prev: const*uv_stat_t, curr: const*uv_stat_t) void;
export type signal_cb   = *fn(handle: *uv_signal_t, signum: int) void;

export type uv_membership = enum {
	UV_LEAVE_GROUP = 0,
	UV_JOIN_GROUP,
};

export @symbol("uv_translate_sys_error") fn translate_sys_error(sys_errno: int) int;

export @symbol("uv_strerror")   fn strerror(err: int) const*char;
export @symbol("uv_strerror_r") fn strerror_r(err: int, buf: *char, buflen: size) *char;

export @symbol("uv_err_name")   fn err_name(err: int) const*char;
export @symbol("uv_err_name_r") fn err_name_r(err: int, buf: *char, buflen: size) *char;
export @symbol("uv_shutdown")   fn shutdown(req: *uv_shutdown_t, handle: *uv_stream_t, cb: shutdown_cb) int;

export @symbol("uv_handle_size")      fn handle_size(_type: uv_handle_type) size;
export @symbol("uv_handle_get_type")  fn handle_get_type(handle: const*uv_handle_t) uv_handle_type;
export @symbol("uv_handle_type_name") fn handle_type_name(_type: uv_handle_type) const*char;
export @symbol("uv_handle_get_data")  fn handle_get_data(handle: const*uv_handle_t) *opaque;
export @symbol("uv_handle_get_loop")  fn handle_get_loop(handle: const*uv_handle_t) *uv_loop_t;
export @symbol("uv_handle_set_data")  fn handle_set_data(handle: *uv_handle_t, data: *opaque) void;

export @symbol("uv_req_size")      fn req_size(_type: uv_req_type) size;
export @symbol("uv_req_get_data")  fn req_get_data(req: const*uv_req_t) *opaque;
export @symbol("uv_req_set_data")  fn req_set_data(req: *uv_req_t, data: *opaque) void;
export @symbol("uv_req_get_type")  fn req_get_type(req: const*uv_req_t) uv_req_type;
export @symbol("uv_req_type_name") fn req_type_name(_type: uv_req_type) const*char;

export @symbol("uv_is_active") fn is_active(handle: const*uv_handle_t) int;
export @symbol("uv_walk")      fn walk(loop: *uv_loop_t, walk_cb: walk_cb, arg: *opaque) void;

export @symbol("uv_print_all_handles")    fn print_all_handles(loop: *uv_loop_t, stream: *FILE) void;
export @symbol("uv_print_active_handles") fn print_active_handles(loop: *uv_loop_t, stream: *FILE) void;

export @symbol("uv_close") fn close(handle: *uv_handle_t, close_cb: close_cb) void;

export @symbol("uv_send_buffer_size") fn send_buffer_size(handle: *uv_handle_t, value: *int) int;
export @symbol("uv_recv_buffer_size") fn recv_buffer_size(handle: *uv_handle_t, value: *int) int;

export @symbol("uv_fileno") fn fileno(handle: const*uv_handle_t, fd: *uv_os_fd_t) int;

export @symbol("uv_buf_init") fn buf_init(base: *char, _len: uint) uv_buf_t;

export @symbol("uv_pipe")       fn pipe(fds: [2]uv_file, read_flags: int, write_flags: int) int;
export @symbol("uv_socketpair") fn socketpair(_type: int, protocol: int, socket_vector: [2]uv_os_sock_t, flags0: int, flags1: int) int;

export @symbol("uv_stream_get_write_queue_size") fn stream_get_write_queue_size(stream: const*uv_stream_t) size;

export @symbol("uv_listen") fn listen(stream: *uv_stream_t, backlog: int, cb: connection_cb) int;
export @symbol("uv_accept") fn accept(server: *uv_stream_t, client: *uv_stream_t) int;

export @symbol("uv_read_start") fn read_start(stream: *uv_stream_t, alloc_cb: alloc_cb, read_cb: read_cb) int;
export @symbol("uv_read_stop")  fn read_stop(stream: *uv_stream_t) int;

export @symbol("uv_write")      fn write(req: *uv_write_t, handle: *uv_stream_t, bufs: const*uv_buf_t, nbufs: uint,  cb: write_cb) int;
export @symbol("uv_write2")     fn write2(req: *uv_write_t, handle: *uv_stream_t, bufs: const*uv_buf_t, nbufs: uint, send_handle: *uv_stream_t, cb: write_cb) int;
export @symbol("uv_try_write")  fn try_write(handle: *uv_stream_t, bufs: const*uv_buf_t, nbufs: uint) int;
export @symbol("uv_try_write2") fn try_write2(handle: *uv_stream_t, bufs: const*uv_buf_t, nbufs: uint, send_handle: *uv_stream_t) int;

export @symbol("uv_is_readable") fn is_readable(handle: const*uv_stream_t) int;
export @symbol("uv_is_writable") fn is_writable(handle: const*uv_stream_t) int;

export @symbol("uv_stream_set_blocking") fn stream_set_blocking(handle: *uv_stream_t, blocking: int) int;

export @symbol("uv_is_closing") fn is_closing(handle: const*uv_handle_t) int;

export @symbol("uv_tcp_init")                 fn tcp_init(loop: *uv_loop_t, handle: *uv_tcp_t) int;
export @symbol("uv_tcp_init_ex")              fn tcp_init_ex(loop: *uv_loop_t, handle: *uv_tcp_t, flags: uint) int;
export @symbol("uv_tcp_open")                 fn tcp_open(handle: *uv_tcp_t, sock: uv_os_sock_t) int;
export @symbol("uv_tcp_nodelay")              fn tcp_nodelay(handle: *uv_tcp_t, enable: int) int;
export @symbol("uv_tcp_keepalive")            fn tcp_keepalive(handle: *uv_tcp_t, enable: int, delay: uint) int;
export @symbol("uv_tcp_simultaneous_accepts") fn tcp_simultaneous_accepts(handle: *uv_tcp_t, enable: int) int;

export type uv_tcp_flags = enum {
	UV_TCP_IPV6ONLY = 1,
};

export @symbol("uv_tcp_bind")        fn tcp_bind(handle: *uv_tcp_t, addr: const*sockaddr, flags: uint) int;
export @symbol("uv_tcp_getsockname") fn tcp_getsockname(handle: const*uv_tcp_t, name: *sockaddr, namelen: *int) int;
export @symbol("uv_tcp_getpeername") fn tcp_getpeername(handle: const*uv_tcp_t, name: *sockaddr, namelen: *int) int;
export @symbol("uv_tcp_close_reset") fn tcp_close_reset(handle: *uv_tcp_t, close_cb: close_cb) int;
export @symbol("uv_tcp_connect")     fn tcp_connect(req: *uv_connect_t, handle: *uv_tcp_t, addr: const*sockaddr, cb: connect_cb) int;

export type uv_udp_flags = enum {
	UV_UDP_IPV6ONLY      = 1,
	UV_UDP_PARTIAL       = 2,
	UV_UDP_REUSEADDR     = 4,
	UV_UDP_MMSG_CHUNK    = 8,
	UV_UDP_MMSG_FREE     = 16,
	UV_UDP_LINUX_RECVERR = 32,
	UV_UDP_RECVMMSG      = 256,
};

export type udp_send_cb = fn (req: *uv_udp_send_t, status: int) void;
export type udp_recv_cb = fn (handle: *uv_udp_t, nread: ssize, buf: const*uv_buf_t, addr: const*sockaddr, flags: uint) void;

export @symbol("uv_udp_init")    fn udp_init(loop: *uv_loop_t, handle: *uv_udp_t) int;
export @symbol("uv_udp_init_ex") fn udp_init_ex(loop: *uv_loop_t, handle: *uv_udp_t, flags: uint) int;
export @symbol("uv_udp_open")    fn udp_open(handle: *uv_udp_t, sock: uv_os_sock_t) int;
export @symbol("uv_udp_bind")    fn udp_bind(handle: *uv_udp_t, addr: const*sockaddr, flags: uint) int;
export @symbol("uv_udp_connect") fn udp_connect(handle: *uv_udp_t, addr: const*sockaddr) int;

export @symbol("uv_udp_getpeername")             fn udp_getpeername(handle: const*uv_udp_t, name: *sockaddr, namelen: *int) int;
export @symbol("uv_udp_getsockname")             fn udp_getsockname(handle: const*uv_udp_t, name: *sockaddr, namelen: *int) int;
export @symbol("uv_udp_set_membership")          fn udp_set_membership(handle: *uv_udp_t, multicast_addr: const*char, interface_addr: const*char, membership: uv_membership) int;
export @symbol("uv_udp_set_source_membership")   fn udp_set_source_membership(handle: *uv_udp_t, multicast_addr: const*char, interface_addr: const*char, source_addr: const*char, membership: uv_membership) int;
export @symbol("uv_udp_set_multicast_loop")      fn udp_set_multicast_loop(handle: *uv_udp_t, on: int) int;
export @symbol("uv_udp_set_multicast_ttl")       fn udp_set_multicast_ttl(handle: *uv_udp_t, ttl: int) int;
export @symbol("uv_udp_set_multicast_interface") fn udp_set_multicast_interface(handle: *uv_udp_t, interface_addr: const*char) int;
export @symbol("uv_udp_set_broadcast")           fn udp_set_broadcast(handle: *uv_udp_t, on: int) int;
export @symbol("uv_udp_set_ttl")                 fn udp_set_ttl(handle: *uv_udp_t, ttl: int) int;
export @symbol("uv_udp_send")                    fn udp_send(req: *uv_udp_send_t, handle: *uv_udp_t, bufs: const*uv_buf_t, nbufs: uint, addr: const*sockaddr, send_cb: udp_send_cb) int;
export @symbol("uv_udp_try_send")                fn udp_try_send(handle: *uv_udp_t, bufs: const*uv_buf_t, nbufs: uint, addr: const*sockaddr) int;
export @symbol("uv_udp_recv_start")              fn udp_recv_start(handle: *uv_udp_t, alloc_cb: alloc_cb, recv_cb: udp_recv_cb) int;
export @symbol("uv_udp_using_recvmmsg")          fn udp_using_recvmmsg(handle: const*uv_udp_t) int;
export @symbol("uv_udp_recv_stop")               fn udp_recv_stop(handle: *uv_udp_t) int;
export @symbol("uv_udp_get_send_queue_size")     fn udp_get_send_queue_size(handle: const*uv_udp_t) size;
export @symbol("uv_udp_get_send_queue_count")    fn udp_get_send_queue_count(handle: const*uv_udp_t) size;

export type uv_tty_mode_t = enum {
	UV_TTY_MODE_NORMAL,
	UV_TTY_MODE_RAW,
	UV_TTY_MODE_IO,
};

export type uv_tty_vtermstate_t = enum {
	UV_TTY_SUPPORTED,
	UV_TTY_UNSUPPORTED,
};

export @symbol("uv_tty_init")            fn tty_init(loop: *uv_loop_t, tty: *uv_tty_t, fd: uv_file, readable: int) int;
export @symbol("uv_tty_set_mode")        fn tty_set_mode(tty: *uv_tty_t, mode: uv_tty_mode_t) int;
export @symbol("uv_tty_reset_mode")      fn tty_reset_mode() int;
export @symbol("uv_tty_get_winsize")     fn tty_get_winsize(tty: *uv_tty_t, width: *int, height: *int) int;
export @symbol("uv_tty_set_vterm_state") fn tty_set_vterm_state(state: uv_tty_vtermstate_t) void;
export @symbol("uv_tty_get_vterm_state") fn tty_get_vterm_state(state: *uv_tty_vtermstate_t) int;
export @symbol("uv_guess_handle")        fn guess_handle(file: uv_file) uv_handle_type;

export def UV_PIPE_NO_TRUNCATE = 1; // 1u << 0

export @symbol("uv_pipe_init")              fn pipe_init(loop: *uv_loop_t, handle: *uv_pipe_t, ipc: int) int;
export @symbol("uv_pipe_open")              fn pipe_open(loop: *uv_pipe_t, file: uv_file) int;
export @symbol("uv_pipe_bind")              fn pipe_bind(handle: *uv_pipe_t, name: const*char) int;
export @symbol("uv_pipe_bind2")             fn pipe_bind2(handle: *uv_pipe_t, name: const*char, namelen: size, flags: uint) int;
export @symbol("uv_pipe_connect")           fn pipe_connect(req: *uv_connect_t, handle: *uv_pipe_t, name: const*char, cb: connect_cb) void;
export @symbol("uv_pipe_connect2")          fn pipe_connect2(req: *uv_connect_t, handle: *uv_pipe_t, name: const*char, namelen: size, flags: uint, cb: connect_cb) int;
export @symbol("uv_pipe_getsockname")       fn pipe_getsockname(handle: const*uv_pipe_t, buffer: *char, _size: *size) int;
export @symbol("uv_pipe_getpeername")       fn pipe_getpeername(handle: const*uv_pipe_t, buffer: *char, _size: *size) int;
export @symbol("uv_pipe_pending_instances") fn pipe_pending_instances(handle: *uv_pipe_t, count: int) void;
export @symbol("uv_pipe_pending_count")     fn pipe_pending_count(handle: *uv_pipe_t) int;
export @symbol("uv_pipe_pending_type")      fn pipe_pending_type(handle: *uv_pipe_t) uv_handle_type;
export @symbol("uv_pipe_chmod")             fn pipe_chmod(handle: uv_pipe_t, flags: int) int;

export type uv_poll_event = enum {
	UV_READABLE    = 1,
	UV_WRITABLE    = 2,
	UV_DISCONNECT  = 4,
	UV_PRIORITIZED = 8,
};

export @symbol("uv_poll_init")        fn poll_init(loop: *uv_loop_t, handle: *uv_poll_t, fd: int) int;
export @symbol("uv_poll_init_socket") fn poll_init_socket(loop: *uv_loop_t, handle: *uv_poll_t, socket: uv_os_sock_t) int;
export @symbol("uv_poll_start")       fn poll_start(handle: *uv_poll_t, events: int, cb: poll_cb) int;
export @symbol("uv_poll_stop")        fn poll_stop(handle: *uv_poll_t) int;

export @symbol("uv_prepare_init")  fn prepare_init(loop: *uv_loop_t, prepare: *uv_prepare_t) int;
export @symbol("uv_prepare_start") fn prepare_start(prepare: *uv_prepare_t, cb: prepare_cb) int;
export @symbol("uv_prepare_stop")  fn prepare_stop(prepare: *uv_prepare_t) int;

export @symbol("uv_check_init")  fn check_init(loop: *uv_loop_t, check: *uv_check_t) int;
export @symbol("uv_check_start") fn check_start(check: *uv_check_t, cb: check_cb) int;
export @symbol("uv_check_stop")  fn check_stop(check: *uv_check_t) int;

export @symbol("uv_idle_init")  fn idle_init(loop: *uv_loop_t, idle: *uv_idle_t) int;
export @symbol("uv_idle_start") fn idle_start(idle: *uv_idle_t, cb: idle_cb) int;
export @symbol("uv_idle_stop")  fn idle_stop(idle: *uv_idle_t) int;

export @symbol("uv_async_init") fn async_init(loop: *uv_loop_t, async: *uv_async_t, async_cb: async_cb) int;
export @symbol("uv_async_send") fn async_send(async: *uv_async_t) int;

export @symbol("uv_timer_init")       fn timer_init(loop: *uv_loop_t, handle: *uv_timer_t) int;
export @symbol("uv_timer_start")      fn timer_start(handle: *uv_timer_t, cb: timer_cb, timeout: u64, repeat: u64) int;
export @symbol("uv_timer_stop")       fn timer_stop(handle: *uv_timer_t) int;
export @symbol("uv_timer_again")      fn timer_again(handle: *uv_timer_t) int;
export @symbol("uv_timer_set_repeat") fn timer_set_repeat(handle: *uv_timer_t, repeat: u64) void;
export @symbol("uv_timer_get_repeat") fn timer_get_repeat(handle: const*uv_timer_t) u64;
export @symbol("uv_timer_get_due_in") fn timer_get_due_in(handle: const*uv_timer_t) u64;

export @symbol("uv_getaddrinfo")  fn getaddrinfo(loop: *uv_loop_t, req: *uv_getaddrinfo_t, getaddrinfo_cb: getaddrinfo_cb, node: const*char, service: const*char, hints: const*addrinfo) int;
export @symbol("uv_freeaddrinfo") fn freeaddrinfo(ai: *addrinfo) void;

export @symbol("uv_getnameinfo") fn getnameinfo(loop: *uv_loop_t, req: *uv_getnameinfo_t, getnameinfo_cb: getnameinfo_cb, addr: const*sockaddr, flags: int) int;

export type uv_stdio_flags = enum {
	UV_IGNORE          = 0x00,
	UV_CREATE_PIPE     = 0x01,
	UV_INHERIT_FD      = 0x02,
	UV_INHERIT_STREAM  = 0x04,
	UV_READABLE_PIPE   = 0x10,
	UV_WRITABLE_PIPE   = 0x20,
	UV_NONBLOCK_PIPE   = 0x40,
	UV_OVERLAPPED_PIPE = 0x40,
};

export type uv_stdio_container_t = struct {
	flags: uv_stdio_flags,
	data: union {
		stream: *uv_stream_t,
		fd:     int,
	},
};

export type uv_process_options_t = struct{
	exit_cb:     exit_cb,
	file:        const*char,
	args:        **char,
	env:         **char,
	cwd:         const*char,
	flags:       uint,
	stdio_count: int,
	stdio:       uv_stdio_container_t,
	uid:         uv_uid_t,
	gid:         uv_gid_t,
};

export type uv_process_flags = enum uint {
	UV_PROCESS_SETUID                       = (1 << 0); // 1
	UV_PROCESS_SETGID                       = (1 << 1); // 2
	UV_PROCESS_WINDOWS_VERBATIM_ARGUMENTS   = (1 << 2); // 4
	UV_PROCESS_DETACHED                     = (1 << 3); // 8
	UV_PROCESS_WINDOWS_HIDE                 = (1 << 4); // 16
	UV_PROCESS_WINDOWS_HIDE_CONSOLE         = (1 << 5); // 32
	UV_PROCESS_WINDOWS_HIDE_GUI             = (1 << 6); // 64
	UV_PROCESS_WINDOWS_FILE_PATH_EXACT_NAME = (1 << 7); // 128
};

export @symbol("uv_spawn")           fn spawn(loop: *uv_loop_t, handle: *uv_process_t, options: const*uv_process_options_t) int;
export @symbol("uv_process_kill")    fn process_kill(process: *uv_process_t, signum: int) int;
export @symbol("uv_kill")            fn kill(pid: int, signum: int) int;
export @symbol("uv_process_get_pid") fn process_get_pid(process: *uv_process_t) uv_pid_t;

export @symbol("uv_queue_work") fn queue_work(loop: *uv_loop_t, req: *uv_work_t, work_cb: work_cb, after_work_cb: after_work_cb) int;

export @symbol("uv_cancel") fn cancel(req: *uv_req_t) int;

export type uv_dirent_type_t = enum {
	UV_DIRENT_UNKNOWN,
	UV_DIRENT_FILE,
	UV_DIRENT_DIR,
	UV_DIRENT_LINK,
	UV_DIRENT_FIFO,
	UV_DIRENT_SOCKET,
	UV_DIRENT_CHAR,
	UV_DIRENT_BLOCK,
};

export @symbol("uv_setup_args")          fn setup_args(argc: int, argv: **char) **char;
export @symbol("uv_get_process_title")   fn get_process_title(buffer: *char, _size: size) int;
export @symbol("uv_set_process_title")   fn set_process_title(title: const*char) int;
export @symbol("uv_resident_set_memory") fn resident_set_memory(rss: *size) int;
export @symbol("uv_uptime")              fn uptime(uptime: *f64) int;
export @symbol("uv_get_osfhandle")       fn get_osfhandle(d: *int) uv_os_fd_t;
export @symbol("uv_open_osfhandle")      fn open_osfhandle(os_fd: uv_os_fd_t) int;

export type uv_rusage_t = struct {
	ru_utime:    uv_timeval_t,
	ru_stime:    uv_timeval_t,
	ru_maxrss:   u64,
	ru_ixrss:    u64,
	ru_idrss:    u64,
	ru_isrss:    u64,
	ru_minflt:   u64,
	ru_majflt:   u64,
	ru_nswap:    u64,
	ru_inblock:  u64,
	ru_oublock:  u64,
	ru_msgsnd:   u64,
	ru_msgrcv:   u64,
	ru_nsignals: u64,
	ru_nvcsw:    u64,
	ru_nivcsw:   u64,
};

export @symbol("uv_getrusage") fn getrusage(rusage: *uv_rusage_t) int;

export @symbol("uv_os_homedir")     fn os_homedir(buffer: *char, _size: *size) int;
export @symbol("uv_os_tmpdir")      fn os_tmpdir(buffer: *char, _size: *size) int;
export @symbol("uv_os_get_passwd")  fn os_get_passwd(pwd: *uv_passwd_t) int;
export @symbol("uv_os_free_passwd") fn os_free_passwd(pwd: *uv_passwd_t) void;
export @symbol("uv_os_get_passwd2") fn os_get_passwd2(pwd: *uv_passwd_t, uid: uv_uid_t) int;
export @symbol("uv_os_get_group")   fn os_get_group(grp: *uv_group_t, gid: uv_uid_t) int;
export @symbol("uv_os_free_group")  fn os_free_group(grp: *uv_group_t) void;
export @symbol("uv_os_getpid")      fn os_getpid() uv_pid_t;
export @symbol("uv_os_getppid")     fn os_getppid() uv_pid_t;
export @symbol("uv_os_getpriority") fn os_getpriority(pid: uv_pid_t, priority: *int) int;
export @symbol("uv_os_setpriority") fn os_setpriority(pid: uv_pid_t, priority: int) int;

export def UV_THREAD_PRIORITY_HIGHEST      =  2;
export def UV_THREAD_PRIORITY_ABOVE_NORMAL =  1;
export def UV_THREAD_PRIORITY_NORMAL       =  0;
export def UV_THREAD_PRIORITY_BELOW_NORMAL = -1;
export def UV_THREAD_PRIORITY_LOWEST       = -2;

export @symbol("uv_thread_getpriority") fn thread_getpriority(tid: uv_thread_t, priority: *int) int;
export @symbol("uv_thread_setpriority") fn thread_setpriority(tid: uv_thread_t, priority: int) int;

export @symbol("uv_available_parallelism") fn available_parallelism() uint;
export @symbol("uv_cpu_info")              fn cpu_info(cpu_infos: **uv_cpu_info_t, count: *int) int;
export @symbol("uv_free_cpu_info")         fn free_cpu_info(cpu_infos: *uv_cpu_info_t, count: int) void;
export @symbol("uv_cpumask_size")          fn cpumask_size() int;

export @symbol("uv_interface_addresses")      fn interface_addresses(addresses: **uv_interface_address_t, count: *int) int;
export @symbol("uv_free_interface_addresses") fn free_interface_addresses(addresses: *uv_interface_address_t, count: int) void;

export @symbol("uv_os_environ")      fn os_environ(envitems: **uv_env_item_t, count: *int) int;
export @symbol("uv_os_free_environ") fn os_free_environ(envitems: *uv_env_item_t, count: int) void;
export @symbol("uv_os_getenv")       fn os_getenv(name: const*char, buffer: *char, _size: *size) int;
export @symbol("uv_os_setenv")       fn os_setenv(name: const*char, value: const*char) int;
export @symbol("uv_os_unsetenv")     fn os_unsetenv(name: const*char) int;
export @symbol("uv_os_gethostname")  fn os_gethostname(buffer: *char, _size: *size) int;
export @symbol("uv_os_uname")        fn os_uname(buffer: *uv_utsname_t) int;

export @symbol("uv_metrics_info")      fn metrics_info(loop: *uv_loop_t, metrics: *uv_metrics_t) int;
export @symbol("uv_metrics_idle_time") fn metrics_idle_time(loop: *uv_loop_t) u64;

export type uv_fs_type = enum {
	UV_FS_UNKNOWN = -1,
	UV_FS_CUSTOM,
	UV_FS_OPEN,
	UV_FS_CLOSE,
	UV_FS_READ,
	UV_FS_WRITE,
	UV_FS_SENDFILE,
	UV_FS_STAT,
	UV_FS_LSTAT,
	UV_FS_FSTAT,
	UV_FS_FTRUNCATE,
	UV_FS_UTIME,
	UV_FS_FUTIME,
	UV_FS_ACCESS,
	UV_FS_CHMOD,
	UV_FS_FCHMOD,
	UV_FS_FSYNC,
	UV_FS_FDATASYNC,
	UV_FS_UNLINK,
	UV_FS_RMDIR,
	UV_FS_MKDIR,
	UV_FS_MKDTEMP,
	UV_FS_RENAME,
	UV_FS_SCANDIR,
	UV_FS_LINK,
	UV_FS_SYMLINK,
	UV_FS_READLINK,
	UV_FS_CHOWN,
	UV_FS_FCHOWN,
	UV_FS_REALPATH,
	UV_FS_COPYFILE,
	UV_FS_LCHOWN,
	UV_FS_OPENDIR,
	UV_FS_READDIR,
	UV_FS_CLOSEDIR,
	UV_FS_STATFS,
	UV_FS_MKSTEMP,
	UV_FS_LUTIME,
};

export @symbol("uv_fs_get_type")         fn fs_get_type(fs: const*uv_fs_t) uv_fs_type;
export @symbol("uv_fs_get_result")       fn fs_get_result(fs: const*uv_fs_t) ssize;
export @symbol("uv_fs_get_system_error") fn fs_get_system_error(fs: const*uv_fs_t) int;
export @symbol("uv_fs_get_ptr")          fn fs_get_ptr(fs: const*uv_fs_t) *opaque;
export @symbol("uv_fs_get_path")         fn fs_get_path(fs: const*uv_fs_t) const*char;
export @symbol("uv_fs_get_statbuf")      fn fs_get_statbuf(fs: *uv_fs_t) *uv_stat_t;

export @symbol("uv_fs_req_cleanup")  fn fs_req_cleanup(req: *uv_fs_t) void;
export @symbol("uv_fs_close")        fn fs_close(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, cb: fs_cb) int;
export @symbol("uv_fs_open")         fn fs_open(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, flags: int, mode: int, cb: fs_cb) int;
export @symbol("uv_fs_read")         fn fs_read(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, bufs: const*uv_buf_t, nbufs: uint, _offset: i64, cb: fs_cb) int;
export @symbol("uv_fs_unlink")       fn fs_unlink(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, cb: fs_cb) int;
export @symbol("uv_fs_write")        fn fs_write(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, bufs: const*uv_buf_t, nbufs: uint, _offset: i64, cb: fs_cb) int;
export @symbol("uv_fs_copyfile")     fn fs_copyfile(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, new_path: const*char, flags: int, cb: fs_cb) int;
export @symbol("uv_fs_mkdir")        fn fs_mkdir(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, mode: int, cb: fs_cb) int;
export @symbol("uv_fs_mkdtemp")      fn fs_mkdtemp(loop: *uv_loop_t, req: *uv_fs_t, tpl: const*char, cb: fs_cb) int;
export @symbol("uv_fs_mkstemp")      fn fs_mkstemp(loop: *uv_loop_t, req: *uv_fs_t, tpl: const*char, cb: fs_cb) int;
export @symbol("uv_fs_rmdir")        fn fs_rmdir(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, cb: fs_cb) int;
export @symbol("uv_fs_scandir")      fn fs_scandir(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, flags: int, cb: fs_cb) int;
export @symbol("uv_fs_scandir_next") fn fs_scandir_next(req: *uv_fs_t, ent: *uv_dirent_t) int;
export @symbol("uv_fs_opendir")      fn fs_opendir(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, cb: fs_cb) int;
export @symbol("uv_fs_readdir")      fn fs_readdir(loop: *uv_loop_t, req: *uv_fs_t, dir: *uv_dir_t, cb: fs_cb) int;
export @symbol("uv_fs_closedir")     fn fs_closedir(loop: *uv_loop_t, req: *uv_fs_t, dir: *uv_dir_t, cb: fs_cb) int;
export @symbol("uv_fs_stat")         fn fs_stat(loop: *uv_loop_t, req: *uv_fs_t, har: *const path, cb: fs_cb) int;
export @symbol("uv_fs_fstat")        fn fs_fstat(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, cb: fs_cb) int;
export @symbol("uv_fs_rename")       fn fs_rename(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, new_path: const*char, cb: fs_cb) int;
export @symbol("uv_fs_fsync")        fn fs_fsync(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, cb: fs_cb) int;
export @symbol("uv_fs_fdatasync")    fn fs_fdatasync(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, cb: fs_cb) int;
export @symbol("uv_fs_ftruncate")    fn fs_ftruncate(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, _offset: i64, cb: fs_cb) int;
export @symbol("uv_fs_sendfile")     fn fs_sendfile(loop: *uv_loop_t, req: *uv_fs_t, out_fd: uv_file, in_fd: uv_file, in_offset: i64, length: size, cb: fs_cb) int;
export @symbol("uv_fs_access")       fn fs_access(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, mode: int, cb: fs_cb) int;
export @symbol("uv_fs_chmod")        fn fs_chmod(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, mode: int, cb: fs_cb) int;
export @symbol("uv_fs_utime")        fn fs_utime(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, atime: f64, mtime: f64, cb: fs_cb) int;
export @symbol("uv_fs_futime")       fn fs_futime(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, atime: f64, mtime: f64,  cb: fs_cb) int;
export @symbol("uv_fs_lutime")       fn fs_lutime(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, atime: f64, mtime: f64, cb: fs_cb) int;
export @symbol("uv_fs_lstat")        fn fs_lstat(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, cb: fs_cb) int;
export @symbol("uv_fs_link")         fn fs_link(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, new_path: const*char, cb: fs_cb) int;
export @symbol("uv_fs_symlink")      fn fs_symlink(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, new_path: const*char, flags: int, cb: fs_cb) int;
export @symbol("uv_fs_readlink")     fn fs_readlink(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, cb: fs_cb) int;
export @symbol("uv_fs_realpath")     fn fs_realpath(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, cb: fs_cb) int;
export @symbol("uv_fs_fchmod")       fn fs_fchmod(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, mode: int, cb: fs_cb) int;
export @symbol("uv_fs_chown")        fn fs_chown(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, uid: uv_uid_t, gid: uv_gid_t, cb: fs_cb) int;
export @symbol("uv_fs_fchown")       fn fs_fchown(loop: *uv_loop_t, req: *uv_fs_t, file: uv_file, uid: uv_uid_t, gid: uv_gid_t, cb: fs_cb) int;
export @symbol("uv_fs_lchown")       fn fs_lchown(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, uid: uv_uid_t, gid: uv_gid_t, cb: fs_cb) int;
export @symbol("uv_fs_statfs")       fn fs_statfs(loop: *uv_loop_t, req: *uv_fs_t, path: const*char, cb: fs_cb) int;

export type uv_fs_event = enum {
	UV_RENAME = 1,
	UV_CHANGE = 2,
};

export @symbol("uv_fs_poll_init")    fn fs_poll_init(loop: *uv_loop_t, handle: *uv_fs_poll_t) int;
export @symbol("uv_fs_poll_start")   fn fs_poll_start(handle: *uv_fs_poll_t, poll_cb: fs_poll_cb, path: const*char, interval: uint) int;
export @symbol("uv_fs_poll_stop")    fn fs_poll_stop(handle: *uv_fs_poll_t) int;
export @symbol("uv_fs_poll_getpath") fn fs_poll_getpath(handle: *uv_fs_poll_t, buffer: *char, _size: *size) int;

export @symbol("uv_signal_init")          fn signal_init(loop: *uv_loop_t, handle: *uv_signal_t) int;
export @symbol("uv_signal_start")         fn signal_start(handle: *uv_signal_t, signal_cb: signal_cb, signum: int) int;
export @symbol("uv_signal_start_oneshot") fn signal_start_oneshot(handle: *uv_signal_t, signal_cb: signal_cb, signum: int) int;
export @symbol("uv_signal_stop")          fn signal_stop(handle: *uv_signal_t) int;

export @symbol("uv_loadavg") fn loadavg(avg: [3]f64) void;

export type uv_fs_event_flags = enum {
	UV_FS_EVENT_WATCH_ENTRY = 1,
	UV_FS_EVENT_STAT        = 2,
	UV_FS_EVENT_RECURSIVE   = 4,
};

export @symbol("uv_fs_event_init")    fn fs_event_init(loop: *uv_loop_t, handle: *uv_fs_event_t) int;
export @symbol("uv_fs_event_start")   fn fs_event_start(handle: *uv_fs_event_t, cb: fs_event_cb, path: const*char, flags: uint) int;
export @symbol("uv_fs_event_stop")    fn fs_event_stop(handle: *uv_fs_event_t) int;
export @symbol("uv_fs_event_getpath") fn fs_event_getpath(handle: *uv_fs_event_t, buffer: *char, _size: *size) int;

export @symbol("uv_ip4_addr") fn ip4_addr(ip: const*char, port: int, addr: *sockaddr_in) int;
export @symbol("uv_ip6_addr") fn ip6_addr(ip: const*char, port: int, addr: *sockaddr_in6) int;

export @symbol("uv_ip4_name") fn ip4_name(src: const*sockaddr_in, dst: *char, _size: size) int;
export @symbol("uv_ip6_name") fn ip6_name(src: const*sockaddr_in6, dst: *char, _size: size) int;
export @symbol("uv_ip_name")  fn ip_name(src: const*sockaddr, dst: *char, _size: size) int;

export @symbol("uv_inet_ntop") fn inet_ntop(af: int, src: const*opaque, dst: *char, _size: size) int;
export @symbol("uv_inet_pton") fn inet_pton(af: int, src: const*char, dst: *opaque) int;


export @symbol("uv_random")         fn random(loop: *uv_loop_t, req: *uv_random_t, buf: *opaque, buflen: size, flags: uint, cb: random_cb) int;
export @symbol("uv_if_indextoname") fn if_indextoname(ifindex: uint, buffer: *char, _size: *size) int;
export @symbol("uv_if_indextoiid")  fn if_indextoiid(ifindex: uint, buffer: *char, _size: *size) int;

export @symbol("uv_exepath") fn exepath(buffer: *char, _size: *size) int;
export @symbol("uv_cwd")     fn cwd(buffer: *char, _size: *size) int;
export @symbol("uv_chdir")   fn chdir(dir: const*char) int;

export @symbol("uv_get_free_memory")        fn get_free_memory() u64;
export @symbol("uv_get_total_memory")       fn get_total_memory() u64;
export @symbol("uv_get_constrained_memory") fn get_constrained_memory() u64;
export @symbol("uv_get_available_memory")   fn get_available_memory() u64;

export @symbol("uv_clock_gettime") fn clock_gettime(clock_id: uv_clock_id, ts: *uv_timespec64_t) int;
export @symbol("uv_hrtime")        fn hrtime() u64;
export @symbol("uv_sleep")         fn sleep(msec: uint) void;

export @symbol("uv_disable_stdio_inheritance") fn disable_stdio_inheritance() void;

export @symbol("uv_dlopen")  fn dlopen(filename: const*char, lib: *uv_lib_t) int;
export @symbol("uv_dlclose") fn dlclose(lib: *uv_lib_t) void;
export @symbol("uv_dlsym")   fn dlsym(lib: *uv_lib_t, name: const*char, ptr: **opaque) int;
export @symbol("uv_dlerror") fn dlerror(lib: const*uv_lib_t) const*char;

export @symbol("uv_mutex_init")           fn mutex_init(handle: *uv_mutex_t) int;
export @symbol("uv_mutex_init_recursive") fn mutex_init_recursive(handle: *uv_mutex_t) int;
export @symbol("uv_mutex_destroy")        fn mutex_destroy(handle: *uv_mutex_t) void;
export @symbol("uv_mutex_lock")           fn mutex_lock(handle: *uv_mutex_t) void;
export @symbol("uv_mutex_trylock")        fn mutex_trylock(handle: *uv_mutex_t) int;
export @symbol("uv_mutex_unlock")         fn mutex_unlock(handle: *uv_mutex_t) void;

export @symbol("uv_rwlock_init")      fn rwlock_init(rwlock: *uv_rwlock_t) int;
export @symbol("uv_rwlock_destroy")   fn rwlock_destroy(rwlock: *uv_rwlock_t) void;
export @symbol("uv_rwlock_rdlock")    fn rwlock_rdlock(rwlock: *uv_rwlock_t) void;
export @symbol("uv_rwlock_tryrdlock") fn rwlock_tryrdlock(rwlock: *uv_rwlock_t) int;
export @symbol("uv_rwlock_rdunlock")  fn rwlock_rdunlock(rwlock: *uv_rwlock_t) void;
export @symbol("uv_rwlock_wrlock")    fn rwlock_wrlock(rwlock: *uv_rwlock_t) void;
export @symbol("uv_rwlock_trywrlock") fn rwlock_trywrlock(rwlock: *uv_rwlock_t) int;
export @symbol("uv_rwlock_wrunlock")  fn rwlock_wrunlock(rwlock: *uv_rwlock_t) void;

export @symbol("uv_sem_init")    fn sem_init(sem: *uv_sem_t, value: uint) int;
export @symbol("uv_sem_destroy") fn sem_destroy(sem: *uv_sem_t) void;
export @symbol("uv_sem_post")    fn sem_post(sem: *uv_sem_t) void;
export @symbol("uv_sem_wait")    fn sem_wait(sem: *uv_sem_t) void;
export @symbol("uv_sem_trywait") fn sem_trywait(sem: *uv_sem_t) int;

export @symbol("uv_cond_init")      fn cond_init(cond: *uv_cond_t) int;
export @symbol("uv_cond_destroy")   fn cond_destroy(cond: *uv_cond_t) void;
export @symbol("uv_cond_signal")    fn cond_signal(cond: *uv_cond_t) void;
export @symbol("uv_cond_broadcast") fn cond_broadcast(cond: *uv_cond_t) void;

export @symbol("uv_barrier_init")    fn barrier_init(barrier: *uv_barrier_t, count: uint) int;
export @symbol("uv_barrier_destroy") fn barrier_destroy(barrier: *uv_barrier_t) void;
export @symbol("uv_barrier_wait")    fn barrier_wait(barrier: *uv_barrier_t) int;

export @symbol("uv_cond_wait")      fn cond_wait(cond: *uv_cond_t, mutex: *uv_mutex_t) void;
export @symbol("uv_cond_timedwait") fn cond_timedwait(cond: *uv_cond_t, mutex: *uv_mutex_t, timeout: u64) int;

export @symbol("uv_once") fn once(guard: *uv_once_t, callback: *fn()void) void;

export @symbol("uv_key_create") fn key_create(key: *uv_key_t) int;
export @symbol("uv_key_delete") fn key_delete(key: *uv_key_t) void;
export @symbol("uv_key_get")    fn key_get(key: *uv_key_t) *opaque;
export @symbol("uv_key_set")    fn key_set(key: *uv_key_t, value: *opaque) void;

export @symbol("uv_gettimeofday") fn gettimeofday(tv: *uv_timeval64_t) int;

export type thread_cb = *fn(arg: *opaque) void;

export @symbol("uv_thread_create") fn thread_create(tid: *uv_thread_t, entry: thread_cb, arg: *opaque) int;

export type uv_thread_create_flags = enum {
	UV_THREAD_NO_FLAGS       = 0x00,
	UV_THREAD_HAS_STACK_SIZE = 0x01,
};

export type uv_thread_options_t = opaque;

export @symbol("uv_thread_create_ex")   fn thread_create_ex(tid: *uv_thread_t, params: const*uv_thread_options_t, entry: thread_cb, arg: *opaque) int;
export @symbol("uv_thread_setaffinity") fn thread_setaffinity(tid: *uv_thread_t, cpumask: *char, oldmask: *char, mask_size: size) int;
export @symbol("uv_thread_getaffinity") fn thread_getaffinity(tid: *uv_thread_t, cpumask: *char, mask_size: size) int;
export @symbol("uv_thread_getcpu")      fn thread_getcpu() int;
export @symbol("uv_thread_self")        fn thread_self() uv_thread_t;
export @symbol("uv_thread_join")        fn thread_join(tid: *uv_thread_t) int;
export @symbol("uv_thread_equal")       fn thread_equal(t1: const*uv_thread_t, t2: const*uv_thread_t) int;

export type uv_any_handle = union {
	async:    uv_async_t,
	check:    uv_check_t,
	fs_event: uv_fs_event_t,
	fs_poll:  uv_fs_poll_t,
	handle:   uv_handle_t,
	idle:     uv_idle_t,
	pipe:     uv_pipe_t,
	poll:     uv_poll_t,
	prepare:  uv_prepare_t,
	process:  uv_process_t,
	stream:   uv_stream_t,
	tcp:      uv_tcp_t,
	timer:    uv_timer_t,
	tty:      uv_tty_t,
	udp:      uv_udp_t,
	signal:   uv_signal_t,
};

export type uv_any_req = union {
	req:         uv_req_t,
	connect:     uv_connect_t,
	write:       uv_write_t,
	shutdown:    uv_shutdown_t,
	udp_send:    uv_udp_send_t,
	fs:          uv_fs_t,
	work:        uv_work_t,
	getaddrinfo: uv_getaddrinfo_t,
	getnameinfo: uv_getnameinfo_t,
	random:      uv_random_t,
};

export @symbol("uv_loop_get_data") fn loop_get_data(loop: const*uv_loop_t) *opaque;
export @symbol("uv_loop_set_data") fn loop_set_data(loop: *uv_loop_t, data: *opaque) void;

export @symbol("uv_utf16_length_as_wtf8") fn utf16_length_as_wtf8(utf16: const*u16, utf16_len: ssize) size;
export @symbol("uv_utf16_to_wtf8")        fn utf16_to_wtf8(utf16: const*u16, utf16_len: ssize, wtf8_ptr: **char, wtf8_len_ptr: *size) int;
export @symbol("uv_wtf8_length_as_utf16") fn wtf8_length_as_utf16(wtf8: const*char) ssize;
export @symbol("uv_wtf8_to_utf16")        fn wtf8_to_utf16(wtf8: const*char, utf16: *u16, utf16_len: size) void;
