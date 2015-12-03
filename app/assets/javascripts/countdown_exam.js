function cd(){
  now = new Date();
  diff = end - now;
  diff = new Date(diff);
  var sec = diff.getSeconds();
  var min = diff.getMinutes();
  if (min < 10){
    min = "0" + min;
  }
  if (sec < 10){
    sec = "0" + sec;
  }
  if(now >= end){
    clearTimeout(timerID);
    alert($("#cdtime").data("msgout"));
  }
  else{
    document.getElementById("cdtime").innerHTML = min + ":" + sec;
    timerID = setTimeout("cd()", 1000);
  }
}
var ready = function() {
  var minutesleft = 0;
  var secondsleft =  parseInt($("#cdtime").data("duration"));
  end = new Date();
  end.setMinutes(end.getMinutes()+minutesleft);
  end.setSeconds(end.getSeconds()+secondsleft);
  cd();
};

$(document).ready(ready);
$(document).on('page:load', ready);
