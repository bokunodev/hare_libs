export type Point = struct {
	x: int,
	y: int,
};

export type FPoint = struct {
	x: f32,
	y: f32,
};

export type Rect = struct {
	x: int,
	y: int,
	w: int,
	h: int,
};

export type FRect = struct {
	x: f32,
	y: f32,
	w: f32,
	h: f32,
};

export fn PointInRect(p: const*Point, r: const*Rect) Bool = {
	return if ((p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h))) {
		yield TRUE;
	} else {
		yield FALSE;
	};
};

export fn RectEmpty(r: const*Rect) Bool = {
	return if ((r == null) || (r.w <= 0) || (r.h <= 0)) {
		yield TRUE;
	} else {
		yield FALSE;
	};
};

export fn RectEquals(a: const*Rect, b: const*Rect) Bool = {
	return if ((a == null) && (b == null) && (a.x == b.x) && (a.y == b.y) && (a.w == b.w) && (a.h == b.h)) {
		yield TRUE;
	} else {
		yield FALSE;
	};
};

export fn PointInFRect(p: const*FPoint, r: const*FRect) Bool = {
	return if ((p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h)) ) {
		yield TRUE;
	} else{
		yield FALSE;
	};
};

export fn FRectEmpty(r: const*FRect) Bool = {
	return if ((r == null) || (r.w <= 0.0) || (r.h <= 0.0)) {
		yield TRUE;
	} else {
		yield FALSE;
	};
};

export fn FRectEqualsEpsilon(a: const*FRect, b: const*FRect, epsilon: const f32) Bool = {
	return if ((a != null) && (b != null) && ((a == b) || ((fabsf(a.x - b.x) <= epsilon) && (fabsf(a.y - b.y) <= epsilon) && (fabsf(a.w - b.w) <= epsilon) && (fabsf(a.h - b.h) <= epsilon)))) {
		yield TRUE;
	} else {
		yield FALSE;
	};
};

def FLT_EPSILON = 1.1920928955078125e-07;

export fn FRectEquals(a: const*FRect, b: const*FRect) Bool = {
	return FRectEqualsEpsilon(a, b, FLT_EPSILON:f32);
};

export @symbol("SDL_HasIntersection"       ) fn HasIntersection(A: const*Rect, B: const*Rect) Bool;
export @symbol("SDL_IntersectRect"         ) fn IntersectRect(A: const*Rect, B: const*Rect, result: *Rect) Bool;
export @symbol("SDL_UnionRect"             ) fn UnionRect(A: const*Rect, B: const*Rect, result: *Rect) void;
export @symbol("SDL_EnclosePoints"         ) fn EnclosePoints(points: const*Point, count: int, clip: const*Rect, result: *Rect) Bool;
export @symbol("SDL_IntersectRectAndLine"  ) fn IntersectRectAndLine(rect: const*Rect , X1: *int, Y1: *int, X2: *int, Y2: *int) Bool;
export @symbol("SDL_HasIntersectionF"      ) fn HasIntersectionF(A: const*FRect, B: const*FRect) Bool;
export @symbol("SDL_IntersectFRect"        ) fn IntersectFRect(A: const*FRect, B: const*FRect, result: *FRect) Bool;
export @symbol("SDL_UnionFRect"            ) fn UnionFRect(A: const*FRect, B: const*FRect, result: *FRect) void;
export @symbol("SDL_EncloseFPoints"        ) fn EncloseFPoints(points: const*FPoint, count: int, clip: const*FRect, result: *FRect) Bool;
export @symbol("SDL_IntersectFRectAndLine" ) fn IntersectFRectAndLine(rect: const*FRect, X1: *f32, Y1: *f32, X2: *f32, Y2: *f32) Bool;
