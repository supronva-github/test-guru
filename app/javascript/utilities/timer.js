document.addEventListener('turbolinks:load', function() {
  var timerView = document.querySelector('.timer')

  if (timerView && timerView.dataset.timer !== "0") {
    var timeLeft = timerView.dataset.timer * 60
    var countdownInterval = setInterval(function() {
      if (timeLeft > 0) {
        timeLeft -= 1
      } else {
        clearInterval(countdownInterval)
        alert('Time is over!')
        document.querySelector('form').submit()
      }

      var resultTime = parseInt(timeLeft / 60) + ':' + timeLeft % 60
      timerView.textContent = resultTime
    }, 1000)
  }
})
