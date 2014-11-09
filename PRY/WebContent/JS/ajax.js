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

function cargarOfi(idOfi){
    xmlHttp=new XMLHttpRequest();
    if (xmlHttp==null){
        alert ("Tu navegador no soporta AJAX!");
        return;
    }
    var url = "../JS/traerOficinaById.jsp";
    url = url + "?idOfi=" + idOfi;
    xmlHttp.onreadystatechange = resultado_mas_detalle2;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function resultado_mas_detalle2(){
    if (xmlHttp.readyState==4){
        document.getElementById("divOficina").innerHTML=xmlHttp.responseText;
    }
    
    function resultado(){
	    if (xmlHttp.readyState==4){
	        document.getElementById("divOficina").innerHTML=xmlHttp.responseText;
	    }
	}

	function vaciar()
	{
	   document.getElementById("creadoajax").innerHTML=" ";
	}
}