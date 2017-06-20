$( document ).ready(function() {
//	var h = $('.content').height();
//	$('.sidebar').height(h-5);
});

function tempSubmit(message){
	$("#searchPane").removeClass('twm');
	$("#searchBar").html("<b><h2>"+message+"</h2></b>");
}

function showLoginWindow(){
	$("#loginPane").toggle();
	$("#loginForm").toggle();
}

function closeMe()
{
    window.opener.location.reload();
    window.close();
}