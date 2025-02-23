; extends

(variable_declarator
  (comment) @_glsl_comment
  (template_string) @injection.content
  (#match? @_glsl_comment "^\\s*/\\*\\s*glsl\\s*\\*/\\s*$")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "glsl"))

