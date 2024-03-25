export type SDL_Point = struct {
	x: int,
	y: int,
};

export type SDL_FPoint = struct {
	x: f32,
	y: f32,
};

export type SDL_Rect = struct {
	x: int,
	y: int,
	w: int,
	h: int,
};

export type SDL_FRect = struct {
	x: f32,
	y: f32,
	w: f32,
	h: f32,
};

export fn PointInRect(p: const*SDL_Point, r: const*SDL_Rect) SDL_bool = {
	return if ((p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h))) {
		yield SDL_TRUE;
	} else {
		yield SDL_FALSE;
	};
};

export fn RectEmpty(r: const*SDL_Rect) SDL_bool = {
	return if ((r == null) || (r.w <= 0) || (r.h <= 0)) {
		yield SDL_TRUE;
	} else {
		yield SDL_FALSE;
	};
};

export fn RectEquals(a: const*SDL_Rect, b: const*SDL_Rect) SDL_bool = {
	return if ((a == null) && (b == null) && (a.x == b.x) && (a.y == b.y) && (a.w == b.w) && (a.h == b.h)) {
		yield SDL_TRUE;
	} else {
		yield SDL_FALSE;
	};
};

export fn PointInFRect(p: const*SDL_FPoint, r: const*SDL_FRect) SDL_bool = {
	return if ((p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h)) ) {
		yield SDL_TRUE;
	} else{
		yield SDL_FALSE;
	};
};

export fn FRectEmpty(r: const*SDL_FRect) SDL_bool = {
	return if ((r == null) || (r.w <= 0.0) || (r.h <= 0.0)) {
		yield SDL_TRUE;
	} else {
		yield SDL_FALSE;
	};
};

export fn FRectEqualsEpsilon(a: const*SDL_FRect, b: const*SDL_FRect, epsilon: const f32) SDL_bool = {
	return if ((a != null) && (b != null) && ((a == b) || ((fabsf(a.x - b.x) <= epsilon) && (fabsf(a.y - b.y) <= epsilon) && (fabsf(a.w - b.w) <= epsilon) && (fabsf(a.h - b.h) <= epsilon)))) {
		yield SDL_TRUE;
	} else {
		yield SDL_FALSE;
	};
};

def SDL_FLT_EPSILON = 1.1920928955078125e-07;

export fn FRectEquals(a: const*SDL_FRect, b: const*SDL_FRect) SDL_bool = {
	return FRectEqualsEpsilon(a, b, SDL_FLT_EPSILON:f32);
};

export @symbol("SDL_HasIntersection"       ) fn HasIntersection(A: const*SDL_Rect, B: const*SDL_Rect) SDL_bool;
export @symbol("SDL_IntersectRect"         ) fn IntersectRect(A: const*SDL_Rect, B: const*SDL_Rect, result: *SDL_Rect) SDL_bool;
export @symbol("SDL_UnionRect"             ) fn UnionRect(A: const*SDL_Rect, B: const*SDL_Rect, result: *SDL_Rect) void;
export @symbol("SDL_EnclosePoints"         ) fn EnclosePoints(points: const*SDL_Point, count: int, clip: const*SDL_Rect, result: *SDL_Rect) SDL_bool;
export @symbol("SDL_IntersectRectAndLine"  ) fn IntersectRectAndLine(rect: const*SDL_Rect , X1: *int, Y1: *int, X2: *int, Y2: *int) SDL_bool;
export @symbol("SDL_HasIntersectionF"      ) fn HasIntersectionF(A: const*SDL_FRect, B: const*SDL_FRect) SDL_bool;
export @symbol("SDL_IntersectFRect"        ) fn IntersectFRect(A: const*SDL_FRect, B: const*SDL_FRect, result: *SDL_FRect) SDL_bool;
export @symbol("SDL_UnionFRect"            ) fn UnionFRect(A: const*SDL_FRect, B: const*SDL_FRect, result: *SDL_FRect) void;
export @symbol("SDL_EncloseFPoints"        ) fn EncloseFPoints(points: const*SDL_FPoint, count: int, clip: const*SDL_FRect, result: *SDL_FRect) SDL_bool;
export @symbol("SDL_IntersectFRectAndLine" ) fn IntersectFRectAndLine(rect: const*SDL_FRect, X1: *f32, Y1: *f32, X2: *f32, Y2: *f32) SDL_bool;
