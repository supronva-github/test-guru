document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')
  
  if (progressBar) {
    setProgressBar(progressBar)
  }
})

function setProgressBar(progressBar) {

  var questionsCount = progressBar.dataset.questionsCount
  var currentQuestionNumber = progressBar.dataset.currentQuestionNumber
  var progressLine = document.querySelector('.progress-bar-line')
  var progressPercent = ((currentQuestionNumber - 1) / questionsCount) * 100

  progressLine.style.width = progressPercent + '%'
  progressLine.textContent = progressPercent + '%'
}
