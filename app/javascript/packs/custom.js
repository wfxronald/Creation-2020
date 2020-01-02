$(document).ready(function(){
    $(".click .copy").click(function(event){
        var $tempElement = $("<input>");
        $("body").append($tempElement);
        $tempElement.val($(this).closest(".click").find("div").text()).select();
        document.execCommand("Copy");
        $tempElement.remove();
    });
});