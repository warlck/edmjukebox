//  $(document).ready(function(){
//       $("#jquery_jplayer_1").jPlayer({
//         ready: function () {
//            $(this).jPlayer("setMedia", {
//                 m4a: "http://media.rawvoice.com/officialaviciipodcast/media2-av.podtree.com/media/podcast/AVICII_LEVELS_-_EPISODE_017.m4a",
//             }) // auto play
//         },
//         swfPath: ".",
//         supplied: "m4a"
//       }); 
// });

$(function() {

	var playerInstance

	var player;

	$('.podcast').on('click', function() {
			var $this = $(this);
			if(player == null) {
					
				player = $("#jquery_jplayer_1").jPlayer({
			        ready: function () {
			                m4a: $this.data('link')
			            }).jPlayer("play"); // auto play
			        },
			        swfPath: ".",
			        supplied: "m4a"
		      }); 

		} 
		else {

			player.jPlayer("setMedia", {
	                m4a: $this.data('link')
	            }).jPlayer("play"); // auto play
		}
		

	console.log($this.data('link'))

	});

});
