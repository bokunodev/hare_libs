use time;
use fmt;
use async;

let counter = 0z;

export fn main() void = {
	let ev = async::new();
	defer ev.destroy(ev);

	for(let i=0; i<10; i+=1) ev.run_async(ev, &print_hello, null);

	time::sleep(5*time::SECOND);
	fmt::println(counter)!;
};

fn print_hello(data: nullable *opaque) void = {
	counter+=1;
	fmt::println("async hello :)")!;
};