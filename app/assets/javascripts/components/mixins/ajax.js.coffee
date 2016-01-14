@AjaxCallbacks = 
  ajax_before_save_callback: ->
    $('.btn_save').append($('<i>').addClass('fa fa-circle-o-notch fa-spin'))

  ajax_after_save_callback: ->
    $('.btn_save i.fa').remove()
        