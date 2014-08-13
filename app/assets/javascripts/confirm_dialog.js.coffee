# Переопределяем диалоговое окно подтверждения удаления записи

$.rails.allowAction = (link) ->
  return true unless  link.attr('data-confirm')
  $.rails.showConfirmDialog(link)
  false

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-confirm'
  html = """
    <div class="modal fade" id="confirmationDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body"><div class="te">#{message}</div></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                    <button type="button" class="btn btn-primary confirm" data-dismiss="modal">Да</button>
                </div>
            </div>
        </div>
    </div>
         """
  $(html).modal()
  $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)