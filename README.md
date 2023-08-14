# what the hell is this
So, initially I wanted to do a sort of desktop companion in Godot, but I quickly realized that maybe it's not that doable... or not that doable with my current skills and knowledge.

For example, Godot is still X11 while I'm on Wayland. XWayland helps, but the exported game doesn't work as expected. To do a winodow passthrough I used a `Polygon2D`, but then I 
realized that if I want to move the window polygon the polygon itself moves, but the points data remain at the initial coordinates.

Perhaps I didn't use the right tool for the job. I'm still a noob learning godot and programming in general so yeah. Maybe it would be possible if I touch some c++ parts of godot idk.
