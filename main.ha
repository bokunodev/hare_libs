use strconv;

export fn main() void = {
	strconv::stou32("xxx")!; // this correctly trigger SIGABORT instead of SIGSEGV
};
