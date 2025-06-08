$(document).ready(function(){
	$('#addBook').click(function(){
		$('#bookModal').modal({
			backdrop: 'static',
			keyboard: false
		});		
		$("#bookModal").on("shown.bs.modal", function () {
			$('#bookForm')[0].reset();				
			$('.modal-title').html("<i class='fa fa-plus'></i> Add book");					
			$('#action').val('addBook');
			$('#save').val('Save');
		});
	});		
	// Handle search functionality
    $('#searchBook').click(function(){
        var searchTerm = $('#searchBookName').val();
        window.location.href = `/books?search=${searchTerm}`;
    });
});