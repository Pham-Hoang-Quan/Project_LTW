var table;
function initTableData() {
    //Data from an URL ?
    table = $('#users').DataTable({
        "processing": true,
    })

}

$(document).ready(function (){
    initTableData();

    $("#list-header").on({
        mouseenter: function() {
            $(this).css("background-color", "lightgray");
        },
        mouseleave: function(){
            $(this).css("background-color", "lightblue");
        },
    });
    $("#btnReloadData").on("click", function(){
        //alert("reload data...")
        table.ajax.reload();
    });
});
