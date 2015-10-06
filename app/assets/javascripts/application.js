//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$( document ).ready(function() {
    $("#button_one").click(function(event){
        questionType = $('#selectQuestion').val()
        if (questionType == 1){
            window.location.href = "/multiple_choice_questions/new/?test_id="+$('#button_one').attr("test_id");
        }
        else{
          
    $("#create").click(function(){
        var e = document.getElementById("selectQuestion");
        var strUser = e.options[e.selectedIndex].value;
        var e = document.getElementById("selectQuestion");
        var strUser1 = e.options[e.selectedIndex].text;

        if (strUser == 1){
            window.location.href = "/descriptive_questions/new";
        }
        else{
            window.location.href = "/multiple_choice_questions/new";
        }
        
    });



});
