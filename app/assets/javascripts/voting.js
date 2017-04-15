
setUpVoteListener()

function setUpVoteListener(){
  document.querySelector('.table').addEventListener('click', function(event){
    document.querySelectorAll('.table tr td').forEach(function(element){
      if(element.id === event.target.id){
        makeAjaxRequest('PUT', path, element, replaceTableBy)
      }
    })
  })
}

function makeAjaxRequest(type, path, element, callbackFunc){
  var xhttp = new XMLHttpRequest()
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       callbackFunc(xhttp.response)
    }
};
  xhttp.open(type, path, true)
  xhttp.setRequestHeader()
  xhttp.send()
}

function replaceTableBy(response){
  document.querySelector('.table').innerHTML = response
}
