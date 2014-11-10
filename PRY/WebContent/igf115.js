function setearBotones() {
	$('#crearEmpleado').click(function(event) {
		$.post('CRUD_EMPLEADO/formulario_CREAR.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#obtenerEmpleado').click(function(event) {
		$.post('CRUD_EMPLEADO/OBTENER.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#actualizarEmpleado').click(function(event) {
		$.post('CRUD_EMPLEADO/formulario_ACTUALIZAR.jsp', function(responseText) {
			$('#dinamico').html(responseText);
			$(".chosen-select").chosen();
		});
	});
	
	$('#crearGenero').click(function(event) {
		$.post('CRUD_GENERO/formulario_CREAR.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#obtenerGenero').click(function(event) {
		$.post('CRUD_GENERO/OBTENER.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#actualizarGenero').click(function(event) {
		$.post('CRUD_GENERO/formulario_ACTUALIZAR.jsp', function(responseText) {
			$('#dinamico').html(responseText);
			$('select').change(function () {
				$('#genero').val($(this).find('option:selected').text());
			});
		});
	});
	
	$('#crearDepartamento').click(function(event) {
		$.post('CRUD_DEPARTAMENTO/CrearDepto.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#obtenerDepartamento').click(function(event) {
		$.post('CRUD_DEPARTAMENTO/ListarDepartamentos.html', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#actualizarDepartamento').click(function(event) {
		$.post('CRUD_DEPARTAMENTO/ActualizarDepartamento.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#eliminarDepartamento').click(function(event) {
		$.post('CRUD_DEPARTAMENTO/EliminarDepartamento.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#darBajaDepartamento').click(function(event) {
		$.post('CRUD_DEPARTAMENTO/DarBajaDepto.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#crearMunicipio').click(function(event) {
		$.post('CRUD_MUNICIPIO/CrearMunicipio.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#obtenerMunicipio').click(function(event) {
		$.post('CRUD_MUNICIPIO/ListarMunicipio.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#actualizarMunicipio').click(function(event) {
		$.post('CRUD_MUNICIPIO/ModificarMunicipio.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#eliminarMunicipio').click(function(event) {
		$.post('CRUD_MUNICIPIO/EliminarMunicipios.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
	$('#darBajaMunicipio').click(function(event) {
		$.post('CRUD_DEPARTAMENTO/DarBajaDepto.jsp', function(responseText) {
			$('#dinamico').html(responseText);
		});
	});
	
}