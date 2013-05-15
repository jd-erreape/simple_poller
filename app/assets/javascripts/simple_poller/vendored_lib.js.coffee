# Accommodate running jQuery or Zepto in noConflict() mode by
# using an anonymous function to redefine the $ shorthand name.
# See http://docs.jquery.com/Using_jQuery_with_Other_Libraries
# and http://zeptojs.com/
class window.VendoredLib

  @libs: ->
    [$, jQuery]

  @lib: ->
    return lib if typeof lib is 'function' for lib in @libs()
    throw new TypeError()