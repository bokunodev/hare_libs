fn __builtin_clz(x: u32) int = {
    abort("not implemented");
};

export fn MostSignificantBitIndex32(x: u32) int = {
    if (x == 0) {
        return -1;
    };

    return 31 - __builtin_clz(x);
};

export fn HasExactlyOneBitSet32(x: u32) SDL_bool = {
    if (x>0 && !((x & (x - 1))>0)) {
        return SDL_TRUE;
    };

    return SDL_FALSE;
};
