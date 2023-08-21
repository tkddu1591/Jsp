$(function(){

    $('.showPopup').click(function(e){
        e.preventDefault();
        $('#orderPopup').show();
    });

    $('#orderPopup .btnClose').click(function(){
        $('#orderPopup').hide();
    });

});

$(function(){

    $('.showPopup').click(function(e){
        e.preventDefault();
        $('#userPopup').show();
    });

    $('#userPopup .btnClose').click(function(){
        $('#userPopup').hide();
    });

});