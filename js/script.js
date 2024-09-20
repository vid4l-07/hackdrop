// fotos
var numfotos = [1,2,3,4,5,6,7,8,9,10,11]

for (i = 0; i < numfotos.length; i++) {
  var foto = "foto"+numfotos[i]
  var modal = document.getElementById("foto-grande-padre");

  var img = document.getElementById(foto);
  var modalImg = document.getElementById("foto-grande");
  var captionText = document.getElementById("caption");
  img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
  }

  var span = document.getElementsByClassName("close")[0];

  span.onclick = function() { 
    modal.style.display = "none";
  }
}

// Secciones
var coll = document.getElementsByClassName("seccion");
var i;

for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var content = this.nextElementSibling;
      if (content.style.maxHeight){
        content.style.maxHeight = null;
      } else {
        content.style.maxHeight = content.scrollHeight + "px";
      }
    });
}