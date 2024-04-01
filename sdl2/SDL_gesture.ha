
export type GestureID = i64;

export @symbol("SDL_RecordGesture"          ) fn RecordGesture(touchId: TouchID) int;
export @symbol("SDL_SaveAllDollarTemplates" ) fn SaveAllDollarTemplates(dst: *RWops) int;
export @symbol("SDL_SaveDollarTemplate"     ) fn SaveDollarTemplate(gestureId: GestureID,dst: *RWops) int;
export @symbol("SDL_LoadDollarTemplates"    ) fn LoadDollarTemplates(touchId: TouchID, src: *RWops) int;
