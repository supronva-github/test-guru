document.addEventListener('turbolinks:load', function() {
  var timerView = document.querySelector('.timer')

  if (timerView) {
    var timeLeft = timerView.dataset.timer * 60
    var id = timerView.dataset.id
    var countdownInterval = setInterval(function() {
      if (timeLeft > 0) {
        timeLeft -= 1
      } else {
        clearInterval(countdownInterval)
        var domain = window.location.protocol + '//' + window.location.host
        window.location.href = `${domain}/test_passages/${id}/result`
      }

      var resultTime = parseInt(timeLeft / 60) + ':' + timeLeft % 60
      timerView.textContent = resultTime
    }, 1000)
  }
})
