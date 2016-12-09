$(document).ready(function(){

    $('form').submit(function(e){
    	e.preventDefault()
        console.log("serialized")
        
        $.ajax({
            url: "/urls",
            method: "POST",
            data: $('input').serialize(),
            // dataType: "html",
            success: function(response){
            	console.log(response)
    				var data = JSON.parse(response)

				document.getElementById("short").setAttribute("href",data['short_url'])
				document.getElementById("short").innerHTML='localhost:9393/'+data['short_url']

            	// $("#table-section").html(response)
				$("#table tbody").prepend("<tr><td>https://" + data.long_url + "</td><td>" + '<a href="' + data.short_url + '">' + data.short_url + '</a>' + "</td><td>" + data.count + "</td></tr>")
            }

        }).done(function(){
        	console.log("sucessful insert")

        })
    })
});																																																										