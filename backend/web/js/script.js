$('#total').focus(function(){
	var totalPrice=0
	totalPrice = totalPrice+parseInt($('#price').val());
	totalPrice = totalPrice+parseInt($('#shipping').val());
	totalPrice = totalPrice+parseInt($('#extraPrice').val());

	$('#total').val(totalPrice);
})