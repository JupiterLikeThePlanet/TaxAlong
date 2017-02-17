$(document).ready(function() {
    $('.new-expense').on('click', function (e) {
        e.preventDefault()

        console.log("hit the application.js");
        console.log("jquery new expense 'this' context: " + this);

        var usr_id = $(this).attr('user_id');
        var shft_id = $(this).attr('shift_id')



        $(this).hide()

        var request = $.ajax ({
            url: "/expense/new",
            method: 'GET',
            datatype: 'html',
            data: {id: usr_id, shift_id: shft_id}
        })

        request.done(function(data){
            $('.append-container').append(data)
        });


        // $.ajax ({
        //     url: "/expense/new",
        //     method: 'GET',
        //     datatype: 'html',
        //     success: function(data) {
        //         console.log("data : " + data);
        //     },
        //     error: function(data) {
        //         console.log("there seems to be an error")
        //     }
        // })


    });
});