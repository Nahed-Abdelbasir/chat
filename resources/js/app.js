/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});





import Echo from "laravel-echo"

window.io = require('socket.io-client');

window.Echo = new Echo({
    broadcaster: 'socket.io',
    host: window.location.hostname + ':6001'
});



var userId = $('meta[name=user_id]').attr("content"); // get auth user id
var usersLength = 0;

window.Echo.join(`online`)
    .here((users) => {
        //
        usersLength = users.length; // get length of users

        // loop for users to get online users
        users.forEach(function(user) {
            if (user.id == userId) {
                return;
            }
            if (usersLength >= 1) {

                $(".users-group .all-users a").each(function() {
                    let dataId = $(this).data("id");
                    if (dataId == user.id) {
                        $(this).prev('.online-icon').toggleClass('d-none');
                    }

                });

            }

        });
    })
    .joining((user) => {
        usersLength++;

        // add every auth user to online users
        $(".users-group .all-users a").each(function() {
            let dataId = $(this).data("id");
            if (dataId == user.id) {
                $(this).prev('.online-icon').toggleClass('d-none');
            }

        });

    })
    .leaving((user) => {
        usersLength--;

        // remove every auth user from online users
        $(".users-group .all-users a").each(function() {
            let dataId = $(this).data("id");
            if (dataId == user.id) {
                $(this).prev('.online-icon').toggleClass('d-none');
            }

        });
    });


// store message in database by using ajax

$(document).on("click", "#btn-msg", function(e) {

    e.preventDefault();

    let reciver_id = $("#reciver-id").val();
    let body = $("#msg").val();
    let url = $("#msg").data('url');
    let data = {
        '_token': $('meta[name=csrf-token]').attr("content"),
        reciver_id,
        body
    };

    $.ajax({
        type: 'POST',
        url: url,
        data: data,
        dataType: "json",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {
            console.log(data);
            $('.no-message').addClass('d-none');
            $(".all-msg").append("<div class='w-50 user-msg mt-2 mb-4 text-center text-white rounded float-right bg-primary' ><p class='pt-2'>" + data.body + "</p></div><div class='clearfix'></div>");
            $("#msg").val("");

            var height = 0;
            $('.all-msg div').each(function() {
                height += parseInt($(this).height());
            });

            $(".all-msg").animate({ scrollTop: height });

        }

    });
});



// make scroll to bottom of the div;

var height = 0;
$('.all-msg div').each(function() {
    height += parseInt($(this).height());
});

$(".all-msg").animate({ scrollTop: height });




window.Echo.channel('chat-group')
    .listen('SendMessage', (e) => {

        let msgCount = $('.user-item').length // get count of unseen messages
        let baseUrl = window.location.origin; // get base url
        let href = baseUrl + "/messages/" + e.message.user_id; // get link of unseen messages owner
        let location = window.location.href; // get location of current page
        let userIdSender = location.substring(location.lastIndexOf('/')).replace('/', ""); // get last string of current page

        // check if auth user recive a message or not 
        if (userId == e.message.reciver_id) {

            if (userIdSender == e.message.user_id) {
                $(".all-msg").append("<div class='w-50 user-msg mt-2 mb-4 text-center text-white rounded float-left bg-secondary' ><p class='pt-2'>" + e.message.body + "</p></div><div class='clearfix'></div>");
                $('.no-message').addClass('d-none');
            }

            if (userIdSender != e.message.user_id) {

                msgCount++;
                $(".btn-group .msg-count").removeClass("d-none");
                $(".btn-group .msg-count").text(msgCount);
                $(".btn-group .dropdown-menu .new-messages").prepend('<a class="dropdown-item user-item" href="' + href + '">' + e.username + '</a>');

            }

        }

        // if (userId == e.message.user_id) {

        //     $(".all-msg").append("<div class='w-50 user-msg mt-2 mb-4 text-center text-white rounded float-right bg-primary' ><p class='pt-2'>" + e.message.body + "</p></div><div class='clearfix'></div>");
        //     $('.no-message').addClass('d-none');
        // }




    });