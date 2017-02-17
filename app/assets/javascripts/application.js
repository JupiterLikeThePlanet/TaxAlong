// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .


$(document).ready(function() {
    $('.new-expense').on('click', function (e) {
        e.preventDefault()

        console.log("hit the application.js");
        console.log("jquery new expense 'this' context: " + this);

        var usr_id = $(this).attr('user_id');
        var shft_id = $(this).attr('shift_id')



        $(this).hide()

        // debugger
        var request = $.ajax ({
            url: "/expense/new",
            method: 'GET',
            datatype: 'html',
            data: {id: usr_id, shift_id: shft_id}
        })
        // debugger
        request.done(function(data){
            $('.append-container').append(data)
            // console.log("response : " + data);
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