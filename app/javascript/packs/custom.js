$(document).ready(function(){
    $(".click .copy").click(function(event){
        // var $tempElement = $("<input>");
        // $("body").append($tempElement);
        // $tempElement.val($(this).closest(".click").find("span").text()).select();
        document.getElementById("to-copy").select();
        document.execCommand("Copy");
        // $tempElement.remove();
    });
});