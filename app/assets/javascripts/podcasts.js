
$(function() {
   
    var upChevron = $('<span class="glyphicon glyphicon-chevron-up"></span>');
    var donwChevron = $('<span class="glyphicon glyphicon-chevron-down"></span>');
   


 
   $(document).on('click', '.more', function(e){
   	  e.preventDefault();
      var $this = $(this);
      var $this_a = $this.find('a');
      $this.prev().find('.user-podcast-summary').css('white-space','normal');
      $this.removeClass('more').addClass('less');
      $this_a.text('Less ');
      upChevron.clone().appendTo($this_a);
       
   });


   $(document).on('click','.less', function(e){
          e.preventDefault();
          var $this = $(this);
          var $this_a = $this.find('a');
          $this.prev().find('.user-podcast-summary').css('white-space','nowrap');
          $this.removeClass('less').addClass('more');
          $this_a.text('More ');
          donwChevron.clone().appendTo($this_a);       

     });  



});