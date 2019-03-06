do ($ = jQuery) ->

  $.fn.floatlabel = () ->
    new FloatLabel(this)
    return this

  $.fn.floatlabelform = () ->
    @find('.floatlabel').each (i, elem)->
        new FloatLabel(elem)
    return this


  class FloatLabel
    constructor: (input_selector) ->
      @input = $ input_selector
      @name = @input.attr('id')
      @label = $("label[for=#{@name}]")
      @input_location = @input.position()
      @input_css_props = {}

      @initLabel()

      @input.on 'input', @moveLabelPosition
      @moveLabelPosition() # handle prefilled input scenario

    getInputCss: (prop_name) ->
      @input_css_props[prop_name] ||= parseInt(@input.css(prop_name), 10)


    initLabel: ->
      @label.addClass 'initlabel'
      @label.css
        left: @input_location.left + @getInputCss('padding-left')
        top:  @input_location.top


    moveLabelPosition: =>
      x_offset = @getInputCss('padding-left')
      y_offset = - @getInputCss('padding-top') - @getInputCss('border-top-width') - @label.outerHeight(true)

      if(@input.val() != "")
        @label.addClass 'transition showlabel'
        @label.css
          left: @input_location.left + x_offset
          top: @input_location.top + y_offset

      else
        @initLabel()
        @label.removeClass 'showlabel'


  class FloatLabelForm
    constructor: (form) ->
      @form = $ form
      @form.find('.floatlabel').each (i, elem)->
        new FloatLabel(elem)
