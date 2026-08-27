toggleTheme = ->
  current = document.documentElement.getAttribute('data-theme')
  next = if current is 'dark' then 'light' else 'dark'
  document.documentElement.setAttribute('data-theme', next)
  try
    localStorage.setItem('theme', next)
  catch e
    # localStorage unavailable (e.g. private browsing)

$(document).on 'turbolinks:load', ->
  $('#dark-mode-toggle').on 'click', toggleTheme
