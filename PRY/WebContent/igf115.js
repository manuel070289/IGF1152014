function setearBotones() {
	$('#crearEmpleado').click(function(event) {
		$.post('CRUD_EMPLEADO/crearForm.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#obtenerEmpleado').click(function(event) {
		$.post('CRUD_EMPLEADO/obtener.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#crearGenero').click(function(event) {
		$.post('CRUD_GENERO/crear.html', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});	
}