if (typeof jQuery !== 'undefined') {
	(function($) {
		/*$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});*/
		
	   //HJ	
	   //alert = function(mesg) {console.trace(mesg)}	 
		
	   $(document).ajaxSuccess(function() {
		   configureDropdowns();
	   });
		
	   
       $(document).ready(function() {
			var autocompleteQueryField = $('input[name="q"]');
			autocompleteQueryField.attr('placeholder','Search Customer...');

			configureDropdowns();
				
		    /*var loadUrl = $('#new_tasks').attr('data-url');
		    $.ajaxSetup ({  
		       cache: true
		    });
		    
		    var ajax_load = "";  
		    $("#new_tasks").html(ajax_load).load(loadUrl);*/
		    
		    //
	    	$('#quicklinks').affix({
	    		offset: {
	    		   top: 240, 
	    		   bottom: 
	    			   function () {
	    		     return (this.bottom = $('#footer').outerHeight(true))
	    		   }
	    		}
	        });
	    	
	    	$('.expandableTable').expandable();
	    	
	    	$('.archiveLink').asyncArchive();
	    	
	    	$('.deleteBtn').asyncDelete();
	    	
	    	/*$('.yui-content').slimScroll({
	    	});*/
	    	
	    	// Set up a global AJAX error handler to handle the 401
			// unauthorized responses. If a 401 status code comes back,
			// the user is no longer logged-into the system and can not
			// use it properly.
	    	//HJ
			/*$.ajaxSetup({
				statusCode : {
					401 : function() {
						// Redirec the to the login page.
						location.href = "./login";
					}
				}
			});*/
	    	
	   });
	})(jQuery);
}

function onLoading(elem) {
	var loadingDiv = $('#spinner').clone();
	loadingDiv.attr('style','text-align:center');
	$(elem).html(loadingDiv);
}

function openModalBox(data,title) {
	var modalTemplate = $('#modalTemplate').clone();
	$(modalTemplate).find('.modal-title').html(title);
	
	onLoading($(modalTemplate).find('.modal-body'));
	
	$(modalTemplate).find('.modal-body').html(data);
	
	$(modalTemplate).on("show.bs.modal", function() {
		var height = $(window).height() - 150;
		$(this).find(".modal-body").css("max-height", height);
	});
	
	modalTemplate.modal('show');
}

function configureDropdowns() {
	var p = $("select:not([name^='filter.'])");
	$(p).chosen();
}

(function($){
    $.fn.showSpinner = function() {
    	$.growl({ title: "", message: "In Progress..." });
    	var loadingDiv = $('#spinner').clone();
    	loadingDiv.attr('style','text-align:center');
    	$(this).html(loadingDiv);
    }    
})(jQuery);

(function($){
    $.fn.asyncArchive = function() {
        var element = this;
        $(this).click(function(e) {
        	e.preventDefault();
        	var link = $(this);
        	
        	var curRow = link.closest('tr');
        	curRow.toggleClass("hidden");
        	
        	$.ajax({
	      	    url: $(link).attr('href'),
	      	    cache: false
	      	}).done(function(data) {
	      		$.growl({ title: "Archived!", message: "Process completed." });
	      		window.location.reload();
	      	});
        	return false;
        });
    }    
})(jQuery);

(function($){
    $.fn.asyncDelete = function() {
        var element = this;

        $(this).click(function(e) {
        	e.preventDefault();
        	var link = $(this);
        	
        	$.growl({title:'',message: "In Progress..." });
        	
        	$.ajax({
	      	    url: $(link).attr('href'),
		      	dataType: "json",
		      	cache: false
	      	}).done(function(data) {
	      		var content = "";
	      		$.each(data.messages, function(i,message){
	      			content += '<p>' + message + '</p>';
	      			content += '<br/>';
	      		});
	      		if(data.error) {
	      			$.growl.error({ title: "Error!", message: content });
	      		} else {
	      			$.growl({ title: "Deleted!", message: content });
	      			window.location.href = data.nextUrl
	      		}
	      	});
        	
        	return false;
        });
    }    
})(jQuery); 

/**
 *  $.growl({ title: "Growl", message: "The kitten is awake!" });
  $.growl.error({ message: "The kitten is attacking!" });
  $.growl.notice({ message: "The kitten is cute!" });
  $.growl.warning({ message: "The kitten is ugly!" });
 */
