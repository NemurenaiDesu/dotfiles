------------------------ gestures ------------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })



------------------------ layer rules ------------------------

hl.layer_rule({ match = { namespace = "match:namespace (launcher)" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "match:namespace (notifications)" }, ignore_alpha = 0 })



------------------------ animations ------------------------

hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "default" })



hl.curve("linear", { type = "bezier", points = { { 0.0, 0.0 }, { 1.0, 1.0 } } })

hl.animation({ leaf = "borderangle", enabled = true, speed = 50, bezier = "linear", style = "loop" })



hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "myBezier", style = "popin 80%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "myBezier", style = "slidevert" })
