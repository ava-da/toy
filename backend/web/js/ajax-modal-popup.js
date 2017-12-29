$().ready(function(){
    $.fn.modal.Constructor.prototype.enforceFocus = function () {
        var $modalElement = this.$element;
        $(document).on('focusin.modal', function (e) {
            var $parent = $(e.target.parentNode);
            if ($modalElement[0] !== e.target && !$modalElement.has(e.target).length
                // add whatever conditions you need here:
                &&
                !$parent.hasClass('cke_dialog_ui_input_select') && !$parent.hasClass('cke_dialog_ui_input_text')) {
                $modalElement.focus()
            }
        })
    };
    loadingDiv = $( '<div class="loading"><i class="fa fa-spinner fa-pulse fa-3x"></i></div>' );
    $(".modal-body").prepend(loadingDiv);
    $(document).on('click', 'a.ajaxcreate, a.ajaxview, a.ajaxupdate', function(event){
        event.preventDefault();
        $('.modal-inner').html('');
        fillModalViaAjax($(this).attr('href'));
        setModalFooter($(this));
        setModalHeader($(this));
        $('#admin-modal').modal('show');
    });
    $(document).on('click', 'a.ajaxdelete', function(event){
        event.preventDefault();
        if (confirm($(this).attr('data-confirmmsg'))) {
            deleteViaAjax($(this).attr('href'));
        };
    });
    $(document).on('submit', '.modal-inner form', function(event){
        event.preventDefault();
        $('.modal-footer button.submit').attr('disabled','disabled');
        submitFormViaAjax($(this), $(this).attr('action'));
    });
    $(document).on( "pageReady", ".modal-inner", function() {
        $(".loading").hide();
    });
    $(document).on('click', 'a.ajaxrequest', function(event){
        event.preventDefault();
        sendAjaxRequestAndRefreshGrid($(this).attr('href'));
    });
});

function sendAjaxRequestAndRefreshGrid (remoteUrl) {
    $.ajax({
        url: remoteUrl,
        type: 'post',
        dataType: 'json',
        success: function(data) {
            if (typeof data.message != 'undefined') {
                showAlert(data.message);
            }
            refreshGrid();
        }
    })
    return false;
}

function fillModalViaAjax (remoteUrl) {
    $.ajax({
        url: remoteUrl,
        type: 'post',
        dataType: 'json',
        beforeSend: function(){
            $(".loading").show();
        },
        success: function(data) {
            $('.modal-inner').html(data.content);
        }
    })
    return false;
}

function submitFormViaAjax (form, remoteUrl) {
    var formData = new FormData(form[0]);
    $.ajax({
        url: remoteUrl,
        type: 'post',
        dataType: 'json',
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        async: false
    }).done(function( data ) {
        if (data.status == 'success') {
            $('#admin-modal').modal('hide');
            showAlert(data.message);
            refreshGrid();
        } else {
            $('.modal-inner').html(data.content);
            $('.modal-footer button.submit').removeAttr('disabled');
        }
    });
    return false;
}

function deleteViaAjax(remoteUrl) {
    $.ajax({
        url: remoteUrl,
        type: 'post',
        dataType: 'json'
    }).done(function( data ) {
        showAlert(data.message);
        refreshGrid();
    });
    return false;
}

function refreshGrid() {
    idOfPjax = $('a.ajaxcreate').attr('data-gridpjaxid');
    $.pjax.reload({container:'#'+idOfPjax});
}

function setModalHeader ($object) {
    headerTag = $( '<h3>' + $object.attr('data-modalheader') + '</h3>' )
    closeBtn = $( '<button class="close" aria-hidden="true" data-dismiss="modal" type="button">×</button>' );
    $('#admin-modal .modal-header').html(headerTag).prepend(closeBtn);
}

function setModalFooter ($object) {
    if (undefined !== $object.attr('data-modalfooterbtns')) {
        if ($('.modal-footer').length !== 0) {
            footerDiv = $('.modal-footer');
        } else{
            footerDiv = $( '<div class="modal-footer"></div>' );
            $('.modal-content').append(footerDiv);
        };
        submitBtn =
            $( '<button class="btn btn-primary pull-right submit" type="button">'
                + '<i class="fa fa-floppy-o"></i>&nbsp; ذخیره'
                + '</button>' );
        closeBtn =
            $( '<button class="btn btn-warning" data-dismiss="modal" type="button">'
                + '<i class="fa fa-repeat"></i>&nbsp; انصراف'
                + '</button>' );
        submitBtn.on('click', function(){
            $('.modal-inner form').submit();
        })
        footerDiv.html(submitBtn).append(closeBtn);
    }else{
        $('.modal-footer').remove();
    };
}
