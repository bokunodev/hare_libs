use types::c;

export type hid_device = opaque;

export type hid_device_info = struct {
	path:                *c::char,
	vendor_id:           u16,
	product_id:          u16,
	serial_number:       *c::wchar,
	release_number:      u16,
	manufacturer_string: *c::wchar,
	product_string:      *c::wchar,
	usage_page:          u16,
	usage:               u16,
	interface_number:    int,
	interface_class:     int,
	interface_subclass:  int,
	interface_protocol:  int,
	next:                *hid_device_info,
};
export @symbol("SDL_hid_init"                     ) fn hid_init() int;
export @symbol("SDL_hid_exit"                     ) fn hid_exit() int;
export @symbol("SDL_hid_device_change_count"      ) fn hid_device_change_count() u32;
export @symbol("SDL_hid_enumerate"                ) fn hid_enumerate(vendor_id: u16, product_id: u16) *hid_device_info;
export @symbol("SDL_hid_free_enumeration"         ) fn hid_free_enumeration(devs: *hid_device_info) void;
export @symbol("SDL_hid_open"                     ) fn hid_open(vendor_id: u16, product_id: u16, serial_number: const*c::wchar) *hid_device;
export @symbol("SDL_hid_open_path"                ) fn hid_open_path(path: const*c::char, bExclusive: int) *hid_device;
export @symbol("SDL_hid_write"                    ) fn hid_write(dev: *hid_device, data: const*c::uchar, length: size) int;
export @symbol("SDL_hid_read_timeout"             ) fn hid_read_timeout(dev: *hid_device, data: *c::uchar, length: size, milliseconds: int) int;
export @symbol("SDL_hid_read"                     ) fn hid_read(dev: *hid_device, data: *c::uchar, length: size) int;
export @symbol("SDL_hid_set_nonblocking"          ) fn hid_set_nonblocking(dev: *hid_device, nonblock: int) int;
export @symbol("SDL_hid_send_feature_report"      ) fn hid_send_feature_report(dev: *hid_device, data: const*c::uchar, length: size) int;
export @symbol("SDL_hid_get_feature_report"       ) fn hid_get_feature_report(dev: *hid_device, data: *c::uchar, length: size) int;
export @symbol("SDL_hid_close"                    ) fn hid_close(dev: *hid_device) void;
export @symbol("SDL_hid_get_manufacturer_string"  ) fn hid_get_manufacturer_string(dev: *hid_device, string: *c::wchar, max_len: size) int;
export @symbol("SDL_hid_get_product_string"       ) fn hid_get_product_string(dev: *hid_device, string: *c::wchar, max_len: size) int;
export @symbol("SDL_hid_get_serial_number_string" ) fn hid_get_serial_number_string(dev: *hid_device, string: *c::wchar, max_len: size) int;
export @symbol("SDL_hid_get_indexed_string"       ) fn hid_get_indexed_string(dev: *hid_device, string_index: int, string: *c::wchar, max_len: size) int;
export @symbol("SDL_hid_ble_scan"                 ) fn hid_ble_scan(active: Bool) void;
