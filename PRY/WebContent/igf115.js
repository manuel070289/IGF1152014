function setearBotones() {
	$('#crearEmpleado').click(function(event) {
		$.post('CRUD_EMPLEADO/formulario_CREAR.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#obtenerEmpleado').click(function(event) {
		$.post('CRUD_EMPLEADO/obtener.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#actualizarEmpleado').click(function(event) {
		$.post('CRUD_EMPLEADO/actualizar.jsp', function(responseText) {
			$('#dinamico').html(responseText);
			$(".chosen-select").chosen();
		});
	});
	
	$('#crearGenero').click(function(event) {
		$.post('CRUD_GENERO/crear.html', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});	
}