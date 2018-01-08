BEGIN { depth=1; layer=0 }

/\{ .* \}/ { print; next }
/\{$/ { depth++ }
/\}$/ { if (depth-- == layer) layer=0 }

/ ha:top / { layer=depth }
{ if (!layer || depth < layer) { print; next } }

/ clearance = / { sub(/= 40.0mil/, "= 0.4mm") }
/ clearance = / { sub(/= 0.62mm/, "= 0.42mm") }
/ clearance = / { sub(/= 10.0mil/, "= 0.42mm") }
/ clearance = / { sub(/= 20.0mil/, "= 0.42mm") }
/ clearance = / { sub(/= 24.0mil/, "= 0.42mm") }
/ clearance = / { sub(/= 22.44mil/, "= 0.42mm") }
/ clearance = / { sub(/= 0.25mm/, "= 0.42mm") }
/ clearpoly = / { sub(/clearpoly =/, "clearpolypoly =") }

{ print }

