When(/^ввели логин:([^"]*) и пароль:([^"]*)/) do |login,pwd|
  step "кликнули на - //input[@name='j_username']"
  step "ввели в //input[@name='j_username'] значение #{login}"
  step "ввели в //input[@name='j_password'] значение #{pwd}"
  step "кликнули на - //input[@value='Войти']"
  step "дождались загрузки - //*[@alt='IMG']"
end
