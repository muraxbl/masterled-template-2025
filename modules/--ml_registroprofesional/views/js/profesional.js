$('#profesional').insertBefore($('#customer-form'));
$('#attachment').insertBefore($('label.required:eq(0)'));
$('#customer-form').attr("enctype","multipart/form-data");
$('#notifications').insertBefore('#content>section');


function displayProfText(){
 if($("#prof-check").is(":checked"))
 {
 	$("#prof-text").css("display", "");
 	$("#attachment").css("display", "");
    $('#customer-form').append( '<input id="isprof" name="isprof" style="display:none" value="1">' );
    $('#fileUpload').prop('required',true);
 	
 	if($('label.required:eq(0)').html().includes('Nombre'))
 	{
 		$('label.required:eq(0)').append('/ Empresa');
 		$('label.required:eq(1)').append('/ Razón social');
 	}
 }
 else
 {
 	var n,a;
 	$("#prof-text").css("display", "none");
 	$("#attachment").css("display", "none");
    $( "#isprof" ).remove();
    $('#fileUpload').prop('required',false);

 	if($('label.required:eq(0)').html().includes('/'))
 	{
 		n=$('label.required:eq(0)').html();
 		a=$('label.required:eq(1)').html('Apellidos');
 		$('label.required:eq(0)').html(cutString(n));
 		$('label.required:eq(0)').html(cutString(a));

 	}
 }	
}

function cutString(txt){
	n=txt.search("/");
	return txt.slice(0,n);
}

function fileValidation(){
	var fileInput =  
            document.getElementById('fileUpload'); 
              
            var filePath = fileInput.value; 
          
            // Allowing file type 
            var allowedExtensions =  
                    /(\.docx|\.doc|\.pdf|\.jpg|\.jpeg|\.png|\.gif)$/i; 
              
            if (!allowedExtensions.exec(filePath)) { 
   				$('#file_error').insertAfter($('#attachment'));
   				$('#file_error').css("display","");
                fileInput.value = ''; 
                 
            } 
            else{
            	$('#file_error').css("display","none");
            }
            
}