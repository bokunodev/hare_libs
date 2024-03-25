use types::c;

export type SDL_bool = enum {
	SDL_FALSE = 0,
	SDL_TRUE  = 1,
};

export def SDL_FALSE = SDL_bool::SDL_FALSE;
export def SDL_TRUE  = SDL_bool::SDL_TRUE;

export @symbol("SDL_malloc")  fn malloc(_size: size) *opaque;
export @symbol("SDL_calloc")  fn calloc(nmemb: size, _size: size) *opaque;
export @symbol("SDL_realloc") fn realloc(mem: *opaque, _size: size) *opaque;
export @symbol("SDL_free")    fn x_free(mem: *opaque) void;

export type SDL_malloc_func  = *fn(_size: size) *opaque;
export type SDL_calloc_func  = *fn(nmemb: size, _size: size) *opaque;
export type SDL_realloc_func = *fn(mem: *opaque, _size: size) *opaque;
export type SDL_free_func    = *fn(mem: *opaque) void;

export @symbol("SDL_GetOriginalMemoryFunctions" ) fn GetOriginalMemoryFunctions(malloc_func: *SDL_malloc_func, calloc_func: *SDL_calloc_func, realloc_func: *SDL_realloc_func, free_func: *SDL_free_func) void;
export @symbol("SDL_GetMemoryFunctions"         ) fn GetMemoryFunctions(malloc_func: *SDL_malloc_func, calloc_func: *SDL_calloc_func, realloc_func: *SDL_realloc_func, free_func: *SDL_free_func) void;
export @symbol("SDL_SetMemoryFunctions"         ) fn SetMemoryFunctions(malloc_func: SDL_malloc_func, calloc_func: SDL_calloc_func, realloc_func: SDL_realloc_func, free_func: SDL_free_func) int;
export @symbol("SDL_GetNumAllocations"          ) fn GetNumAllocations() int;

export @symbol("SDL_getenv") fn getenv(name: const*c::char) *c::char;
export @symbol("SDL_setenv") fn setenv(name: const*c::char, value: const*c::char, overwrite: int) int;


export @symbol("SDL_qsort"   ) fn qsort(base: *opaque, nmemb: size, _size: size, compare: *fn(const*opaque, const*opaque)int) void;
export @symbol("SDL_bsearch" ) fn bsearch(key: const*opaque, base: const*opaque, nmemb: size, _size: size, compare: *fn(const*opaque, const*opaque)int) *opaque;

export @symbol("SDL_abs"      ) fn abs(x: int) int;
export @symbol("SDL_isalpha"  ) fn isalpha(x: int) int;
export @symbol("SDL_isalnum"  ) fn isalnum(x: int) int;
export @symbol("SDL_isblank"  ) fn isblank(x: int) int;
export @symbol("SDL_iscntrl"  ) fn iscntrl(x: int) int;
export @symbol("SDL_isdigit"  ) fn isdigit(x: int) int;
export @symbol("SDL_isxdigit" ) fn isxdigit(x: int) int;
export @symbol("SDL_ispunct"  ) fn ispunct(x: int) int;
export @symbol("SDL_isspace"  ) fn isspace(x: int) int;
export @symbol("SDL_isupper"  ) fn isupper(x: int) int;
export @symbol("SDL_islower"  ) fn islower(x: int) int;
export @symbol("SDL_isprint"  ) fn isprint(x: int) int;
export @symbol("SDL_isgraph"  ) fn isgraph(x: int) int;
export @symbol("SDL_toupper"  ) fn toupper(x: int) int;
export @symbol("SDL_tolower"  ) fn tolower(x: int) int;
export @symbol("SDL_crc16"    ) fn crc16(crc: u16, data: const*opaque, _len: size) u16;
export @symbol("SDL_crc32"    ) fn crc32(crc: u32, data: const*opaque, _len: size) u32;
export @symbol("SDL_memset"   ) fn memset(dst: *opaque, c: int, _len: size) *opaque;
export @symbol("SDL_memcpy") fn memcpy(dst: *opaque, src: const*opaque, _len: size) *opaque;


export @symbol("SDL_memmove" ) fn memmove(dst: *opaque, src: const*opaque, _len: size) *opaque;
export @symbol("SDL_memcmp"  ) fn memcmp(s1: const*opaque, s2: const*opaque, _len: size) int;


export @symbol("SDL_wcslen"  ) fn wcslen(w_str: const*c::wchar) size;
export @symbol("SDL_wcslcpy" ) fn wcslcpy(dst: *c::wchar, src: const*c::wchar, max_len: size) size;
export @symbol("SDL_wcslcat" ) fn wcslcat(dst: *c::wchar, src: const*c::wchar, max_len: size) size;
export @symbol("SDL_wcsdup"  ) fn wcsdup(w_str: const*c::wchar) *c::wchar;
export @symbol("SDL_wcsstr"  ) fn wcsstr(haystack: const*c::wchar, needle: const*c::wchar) *c::wchar;


export @symbol("SDL_wcscmp"      ) fn wcscmp(str1: const*c::wchar, str2: const*c::wchar) int;
export @symbol("SDL_wcsncmp"     ) fn wcsncmp(str1: const*c::wchar, str2: const*c::wchar, max_len: size) int;
export @symbol("SDL_wcscasecmp"  ) fn wcscasecmp(str1: const*c::wchar, str2: const*c::wchar) int;
export @symbol("SDL_wcsncasecmp" ) fn wcsncasecmp(str1: const*c::wchar, str2: const*c::wchar, _len: size) int;


export @symbol("SDL_strlen"      ) fn strlen(_str: const*c::char) size;
export @symbol("SDL_strlcpy"     ) fn strlcpy(dst: *c::char, src: const*c::char, max_len: size) size;
export @symbol("SDL_utf8strlcpy" ) fn utf8strlcpy(dst: *c::char, src: const*c::char, dst_bytes: size) size;
export @symbol("SDL_strlcat"     ) fn strlcat(dst: *c::char, src: const*c::char, max_len: size) size;
export @symbol("SDL_strdup"      ) fn strdup(_str: const*c::char) *c::char;
export @symbol("SDL_strrev"      ) fn strrev(_str: *c::char) *c::char;
export @symbol("SDL_strupr"      ) fn strupr(_str: *c::char) *c::char;
export @symbol("SDL_strlwr"      ) fn strlwr(_str: *c::char) *c::char;
export @symbol("SDL_strchr"      ) fn strchr(_str: const*c::char, c: int) *c::char;
export @symbol("SDL_strrchr"     ) fn strrchr(_str: const*c::char, c: int) *c::char;
export @symbol("SDL_strstr"      ) fn strstr(haystack: const*c::char, needle: const*c::char) *c::char;
export @symbol("SDL_strcasestr"  ) fn strcasestr(haystack: const*c::char, needle: const*c::char) *c::char;
export @symbol("SDL_strtokr"     ) fn strtokr(s1: *c::char, s2: const*c::char, saveptr: **c::char) *c::char;
export @symbol("SDL_utf8strlen"  ) fn utf8strlen(_str: const*c::char) size;
export @symbol("SDL_utf8strnlen" ) fn utf8strnlen(_str: const*c::char, bytes: size) size;

export @symbol("SDL_itoa"   ) fn itoa(value: int, _str: *c::char, radix: int) *c::char;
export @symbol("SDL_uitoa"  ) fn uitoa(value: uint, _str: *c::char, radix: int) *c::char;
export @symbol("SDL_ltoa"   ) fn ltoa(value: i64, _str: *c::char, radix: int) *c::char;
export @symbol("SDL_ultoa"  ) fn ultoa(value: u64, _str: *c::char, radix: int) *c::char;
export @symbol("SDL_lltoa"  ) fn lltoa(value: i64, _str: *c::char, radix: int) *c::char;
export @symbol("SDL_ulltoa" ) fn ulltoa(value: u64, _str: *c::char, radix: int) *c::char;

export @symbol("SDL_atoi"     ) fn atoi(_str: const*c::char) int;
export @symbol("SDL_atof"     ) fn atof(_str: const*c::char) f64;
export @symbol("SDL_strtol"   ) fn strtol(_str: const*c::char, endp: **c::char, base: int) i64;
export @symbol("SDL_strtoul"  ) fn strtoul(_str: const*c::char, endp: **c::char, base: int) u64;
export @symbol("SDL_strtoll"  ) fn strtoll(_str: const*c::char, endp: **c::char, base: int) i64;
export @symbol("SDL_strtoull" ) fn strtoull(_str: const*c::char, endp: **c::char, base: int) u64;
export @symbol("SDL_strtod"   ) fn strtod(_str: const*c::char, endp: **c::char) f64;

export @symbol("SDL_strcmp"      ) fn strcmp(str1: const*c::char, str2: const*c::char) int;
export @symbol("SDL_strncmp"     ) fn strncmp(str1: const*c::char, str2: const*c::char, max_len: size) int;
export @symbol("SDL_strcasecmp"  ) fn strcasecmp(str1: const*c::char, str2: const*c::char) int;
export @symbol("SDL_strncasecmp" ) fn strncasecmp(str1: const*c::char, str2: const*c::char, _len: size) int;

export @symbol("SDL_sscanf"    ) fn sscanf(text: const*c::char, fmt: const*c::char...) int;
export @symbol("SDL_vsscanf"   ) fn vsscanf(text: const*c::char, fmt: const*c::char, ap: valist) int;
export @symbol("SDL_snprintf"  ) fn snprintf(text: *c::char, max_len: size, fmt: const*c::char, ... ) int;
export @symbol("SDL_vsnprintf" ) fn vsnprintf(text: *c::char, max_len: size, fmt: const*c::char, ap: valist) int;
export @symbol("SDL_asprintf"  ) fn asprintf(strp: **c::char, fmt: const*c::char...) int;
export @symbol("SDL_vasprintf" ) fn vasprintf(strp: **c::char, fmt: const*c::char, ap: valist) int;

export @symbol("SDL_acos"      ) fn acos(x: f64) f64;
export @symbol("SDL_acosf"     ) fn acosf(x: f32) f32;
export @symbol("SDL_asin"      ) fn asin(x: f64) f64;
export @symbol("SDL_asinf"     ) fn asinf(x: f32) f32;
export @symbol("SDL_atan"      ) fn atan(x: f64) f64;
export @symbol("SDL_atanf"     ) fn atanf(x: f32) f32;
export @symbol("SDL_atan2"     ) fn atan2(y: f64, x: f64) f64;
export @symbol("SDL_atan2f"    ) fn atan2f(y: f32, x: f32) f32;
export @symbol("SDL_ceil"      ) fn ceil(x: f64) f64;
export @symbol("SDL_ceilf"     ) fn ceilf(x: f32) f32;
export @symbol("SDL_copysign"  ) fn copysign(x: f64, y: f64) f64;
export @symbol("SDL_copysignf" ) fn copysignf(x: f32, y: f32) f32;
export @symbol("SDL_cos"       ) fn cos(x: f64) f64;
export @symbol("SDL_cosf"      ) fn cosf(x: f32) f32;
export @symbol("SDL_exp"       ) fn exp(x: f64) f64;
export @symbol("SDL_expf"      ) fn expf(x: f32) f32;
export @symbol("SDL_fabs"      ) fn fabs(x: f64) f64;
export @symbol("SDL_fabsf"     ) fn fabsf(x: f32) f32;
export @symbol("SDL_floor"     ) fn floor(x: f64) f64;
export @symbol("SDL_floorf"    ) fn floorf(x: f32) f32;
export @symbol("SDL_trunc"     ) fn trunc(x: f64) f64;
export @symbol("SDL_truncf"    ) fn truncf(x: f32) f32;
export @symbol("SDL_fmod"      ) fn fmod(x: f64, y: f64) f64;
export @symbol("SDL_fmodf"     ) fn fmodf(x: f32, y: f32) f32;
export @symbol("SDL_log"       ) fn log(x: f64) f64;
export @symbol("SDL_logf"      ) fn logf(x: f32) f32;
export @symbol("SDL_log10"     ) fn log10(x: f64) f64;
export @symbol("SDL_log10f"    ) fn log10f(x: f32) f32;
export @symbol("SDL_pow"       ) fn pow(x: f64, y: f64) f64;
export @symbol("SDL_powf"      ) fn powf(x: f32, y: f32) f32;
export @symbol("SDL_round"     ) fn round(x: f64) f64;
export @symbol("SDL_roundf"    ) fn roundf(x: f32) f32;
export @symbol("SDL_lround"    ) fn lround(x: f64) i64;
export @symbol("SDL_lroundf"   ) fn lroundf(x: f32) i64;
export @symbol("SDL_scalbn"    ) fn scalbn(x: f64, n: int) f64;
export @symbol("SDL_scalbnf"   ) fn scalbnf(x: f32, n: int) f32;
export @symbol("SDL_sin"       ) fn sin(x: f64) f64;
export @symbol("SDL_sinf"      ) fn sinf(x: f32) f32;
export @symbol("SDL_sqrt"      ) fn sqrt(x: f64) f64;
export @symbol("SDL_sqrtf"     ) fn sqrtf(x: f32) f32;
export @symbol("SDL_tan"       ) fn tan(x: f64) f64;
export @symbol("SDL_tanf"      ) fn tanf(x: f32) f32;


export type SDL_iconv_t = *opaque;

export @symbol("SDL_iconv_open"   ) fn iconv_open(tocode: const*c::char, fromcode: const*c::char) SDL_iconv_t;
export @symbol("SDL_iconv_close"  ) fn iconv_close(cd: SDL_iconv_t) int;
export @symbol("SDL_iconv"        ) fn iconv(cd: SDL_iconv_t, inbuf: const**c::char, inbytesleft: *size, outbuf: **c::char, outbytesleft: *size) size;
export @symbol("SDL_iconv_string" ) fn iconv_string(tocode: const*c::char, fromcode: const*c::char, inbuf: const*c::char, inbytesleft: size) *c::char;
