use fmt;
use getopt;
use strconv;
use os;
use types::c;

use sdl2;
use sdl2::image;

def scr_width = 1440;
def scr_height = 900;

export fn main() void = {
	const opts = getopt::parse(os::args,
		"draw images to X11 root window (support only single monitor setup)",
		('d', "ms", "delay between images, default 2s (ignored for animated webp/gif)"),
		"images...");
	defer getopt::finish(&opts);

	//if(is_error(sdl2::Init(sdl2::INIT_EVERYTHING))) abort(c::tostr(sdl2::GetError())!);
	//defer sdl2::Quit();

	//if(is_error(image::Init(image::INIT_EVERYTHING))) abort(c::tostr(sdl2::GetError())!);
	//defer image::Quit();

	//const root = x11_root_window();

	if(0 == len(opts.args)) {
		fmt::println("no images given")!;
		return;
	};

	let delay:u32 = 2000;
	if(len(opts.opts) > 0) {
		delay = strconv::stou32(opts.opts[0].1)!;
	};

	//const filepath = c::fromstr("home/user/Public/projects/hare_libs/examples/bgx/image.gif");
	//const openmode = c::fromstr("rb");
	//const animation = image::LoadGIFAnimation_RW(sdl2::RWFromFile(filepath, openmode));

	//const rect = sdl2::Rect{
		//x = 0,
		//y = 0,
		//w = scr_width,
		//h = scr_height,
	//};
//
	//const window = sdl2::CreateWindowFrom(xroot);
	//defer sdl2::DestroyWindow(window);
	//
	//const render = sdl2::CreateRenderer(window, -1, sdl2::RendererFlags::RENDERER_SOFTWARE);
	//defer sdl2::DestroyRenderer(render);
//
	//let textures:[]*sdl2::Texture = [];
	//const frames = (animation.frames : *[*]*sdl2::Surface);
	//for(let i=0; i<animation.count; i+=1) {
		//const surface = frames[i];
		//append(textures, sdl2::CreateTextureFromSurface(render, surface));
		//sdl2::SetTextureScaleMode(textures[i], sdl2::ScaleMode::ScaleModeBest);
	//};
//
	//const event = sdl2::Event{...};
	//for(true) {
		//for(let i=0; i<animation.count; i+=1) {
			//sdl2::RenderCopy(render, textures[i], &sdl2::Rect{w=animation.w, h=animation.h,...}, &rect);
			//sdl2::RenderPresent(render);
			//sdl2::RenderFlush(render);
//
			//sdl2::Delay(((animation.delays : *[*]int)[i]):u32);
//
			//for(0 != sdl2::PollEvent(&event)) {
				//if(event._type == sdl2::EventType::QUIT) return;
			//};
		//};
	//};
};

export @symbol("XOpenDisplay"        ) fn XOpenDisplay(name: *c::char) *opaque;
export @symbol("XDefaultRootWindow"  ) fn XDefaultRootWindow(dis: *opaque) *opaque;

fn is_error(e: (int|*opaque)) bool = {
	return match(e) {
		case let n:int     => yield (0 > n);
		case let p:*opaque => yield (null == p);
	};
};

fn x11_root_window() *opaque = {
	const display = XOpenDisplay(c::fromstr(":0.0"));
	if(null == display) abort("failed to XOpenDisplay(c::fromstr(\":0.0\"));");
	const root = XDefaultRootWindow(display);
	if(null == root) abort("failed to XDefaultRootWindow(display);");
	return root;
};
