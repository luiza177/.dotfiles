; extends

; { key: value }  object property
(pair
  key: (_) @_key
  value: (_) @property.inner) @property.outer

; Q: or?
; (object
;   (pair
;     key: (_) @property.lhs
;     value: (_) @property.inner @property.rhs) @property.outer)

; key = value  (shorthand assignment in destructuring etc.)
(assignment_pattern
  left: (_) @property.lhs
  right: (_) @property.inner) @property.outer

; { key }  shorthand property — value IS the key, so inner = outer
(shorthand_property_identifier) @property.inner @property.outer
