// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage

// 追加
//= require cocoon
// 追加


//= require bootstrap-sprockets
//= require_tree .



    $(function() {

    	$('.disc input[type=text]').eq(0).val(1);
        $('.song input[type=text]').eq(0).val(1);


    	$(document).on('click', '.links .add_fields', function() {

    		var disc_size = $(".disc").length;
    		for (var i = 0; i < disc_size*2; i++) {
    			if (i % 2 == 0) {
    				if (i == 0) {
	    				$('.disc input[type=text]').eq(i).val(1);
    				} else {
		    			$('.disc input[type=text]').eq(i).val(i/2+1);
		    		}
	    		}
    		}


    		var songs_size = $(".songs").length;

            for (var i = 0; i < songs_size; i++){
                $('.songs').removeClass('songs'+i);
            }
            for (var i = 0; i < songs_size; i++){
                $('.songs').eq(i).addClass('songs'+i);
            }

            for (var i = 0; i < songs_size; i++){
                var songs_i_song_class_name = ".songs"+i+" .song";
                var songs_i_song_size = $(songs_i_song_class_name).length;
                for (var j = 0; j < songs_i_song_size*2; j++) {
                    if (j % 2 == 0) {
                        if (j == 0) {
                            $(songs_i_song_class_name+' input[type=text]').eq(j).val(1);
                        }
                        else {
                            $(songs_i_song_class_name+' input[type=text]').eq(j).val(j/2+1);
                        }
                    }
                }
            }
    	});
	})




$(function() {
  $('.a').slick({
      dots: true,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.a').slick('goTo', $(this).index());
  });
});
