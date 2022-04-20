const doc = document
const resourceName = window.GetParentResourceName ? GetParentResourceName () : 'duuty'

$(function () {
    window.addEventListener('message', function (event) {
        const e = event.data
        if (e.type === "enableui") {
            if (e.part === "body") {
                doc.getElementById("body").style.display = "block"
            }
            if (event.data.part === "Duty") {
                var c = document.getElementById("Duty");
                if (c.style.visibility === "visible") {
                }
                c.style.visibility = "visible";
              }
            } else if (e.part === "Notify") {
              $("#Notify").slideDown("slow")
              $("#errorinput").text(e.reason)
              setTimeout(function() {
                  $("#Notify").slideUp("slow");
              }, 3000);
            }
            let playerName = event.data.playerName
            $("#playerName").text(playerName)
    });
   $("#Notify").hide();
    
});
  





