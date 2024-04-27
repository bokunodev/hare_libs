use fmt;
use uv;

export type EventLoop = struct{
	loop: *uv::uv_loop_t,
	destroy: *fn(ev: *EventLoop) void,
	run_async: *fn(ev: *EventLoop, func: AsyncFunc, data: nullable *opaque) void,
};

fn destroy(ev: *EventLoop) void = {
	uv::loop_close(ev.loop);
	uv::stop(ev.loop);
	free(ev.loop);
};

export type AsyncFunc = *fn(data: nullable *opaque) void;

type Task = struct{
	func: AsyncFunc,
	data: nullable *opaque,
};

fn async_cleanup(handle: *uv::uv_handle_t) void = { 
	fmt::println("[async] async_cleanup")!;
	free(uv::handle_get_data(handle));
	free(handle);
};

fn async_wrapper(async: *uv::uv_async_t) void = {
	fmt::println("[async] async_wrapper")!;
	let async_handle = async:*uv::uv_handle_t;
	let task = uv::handle_get_data(async_handle):*Task;
	task.func(task.data);
	uv::close(async_handle, &async_cleanup);
};

fn run_async(ev: *EventLoop, func: AsyncFunc, data: nullable *opaque) void = {
	fmt::println("[async] run_async")!;
	let async = uv::calloc(uv::sizeof_uv_async_t()):*uv::uv_async_t;
	uv::async_init(ev.loop, async, &async_wrapper);
	
	let task = alloc(Task{func = func, data = data});

	let async_handle = async:*uv::uv_handle_t;
	uv::handle_set_data(async_handle, task);

	uv::async_send(async);
};

export fn new() *EventLoop = {
	let ev = alloc(EventLoop{
		loop = uv::calloc(uv::sizeof_uv_loop_t()):*uv::uv_loop_t,
		destroy = &destroy,
		run_async = &run_async,
	});

	uv::loop_init(ev.loop);
	uv::run(ev.loop, uv::uv_run_mode::UV_RUN_DEFAULT);

	return ev;
};