$(document).ready(function() {

    $('.new-expense').on('click', function (e) {
        e.preventDefault()

        console.log("hit the application.js");
        console.log("jquery new expense 'this' context: " + this);

        var usr_id = $(this).attr('user_id');
        var shft_id = $(this).attr('shift_id')

        var shfDiv = '<input type="hidden" name="shiftId" value=' + shft_id + '>'

        $(this).hide()

        // debugger
        var request = $.ajax ({
            url: "/expense/new",
            method: 'GET',
            datatype: 'html',
            data: {id: usr_id, shift_id: shft_id}
        })
        // debugger
        request.done(function(response){
            console.log(request.data);
            $('.append-container').append(response, shfDiv);
        });




    });
});