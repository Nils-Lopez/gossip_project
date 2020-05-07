function showPassword() {
		  var x = document.getElementById("input_password");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		  var z = document.getElementById("input_password2");
		  if (z.type === "password") {
		    z.type = "text";
		  } else {
		    z.type = "password";
		  }
		} 	