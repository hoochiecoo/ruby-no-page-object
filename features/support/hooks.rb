
# Выполняется перед сценарием
Before('not @rest') do
  remote_or_local
  set_page_timeouts
end

# Выполняется после сценария
After('not @rest') do
  screenshot
  quit_browser
end


AfterStep ('not @rest') do
  sleep 1
end