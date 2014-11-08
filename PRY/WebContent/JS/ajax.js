var xmlHttp;

function cargarMun(depto){
    xmlHttp=new XMLHttpRequest();
    if (xmlHttp==null){
        alert ("Tu navegador no soporta AJAX!");
        return;
    }
    var url = "../JS/traerMunicipios.jsp";
    url = url + "?idDep=" + depto;
    xmlHttp.onreadystatechange = resultado_mas_detalle;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function resultado_mas_detalle(){
    if (xmlHttp.readyState==4){
        document.getElementById("muni").innerHTML=xmlHttp.responseText;
    }
    
    function resultado(){
	    if (xmlHttp.readyState==4){
	        document.getElementById("muni").innerHTML=xmlHttp.responseText;
	    }
	}

	function vaciar()
	{
	   document.getElementById("creadoajax").innerHTML=" ";
	}
}