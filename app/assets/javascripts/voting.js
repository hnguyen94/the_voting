
setUpVoteListener()
setUpResultListener()
setUpResetVotesListener()

function setUpVoteListener(){
  document.querySelector('.table').addEventListener('click', function(event){
    document.querySelectorAll('.table tr').forEach(function(element){
      if(element.getAttribute('name') === event.target.parentElement.parentElement.getAttribute('name')){
        path = event.target.getAttribute('name')
        console.log('click')
        makeAjaxRequest('POST', path, replaceTableBy)
      }
    })
  })
}

function setUpResultListener(){
  document.querySelector('#show_results').addEventListener('click', function(event){
    event.preventDefault()
    console.log('show')
    path = event.target.getAttribute('href')
    makeAjaxRequest('GET',path,replaceTableBy)
  })
}

function setUpResetVotesListener(){
  document.querySelector('#reset_votes').addEventListener('click',function(event){
    event.preventDefault()
    console.log('reset')
    path = event.target.getAttribute('href')
    makeAjaxRequest('DELETE',path,replaceTableBy)
  })
}

function makeAjaxRequest(method, path, callbackFunc){
  formData = new FormData()
  var xhttp = new XMLHttpRequest()
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      callbackFunc(xhttp.responseText)
    }
};
  csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  xhttp.open(method, path, true)
  xhttp.setRequestHeader('X-CSRF-Token', csrfToken)
  xhttp.send()
}

function replaceTableBy(response){
  console.log(response)
  document.querySelector('.table').innerHTML = response
}

function replaceHTMLBy(response){
  console.log('replaceHTML')
  document.querySelector('html').innerHTML = response
}
