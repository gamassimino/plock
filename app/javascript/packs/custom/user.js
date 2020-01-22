document.onreadystatechange = () => {
  if (document.readyState === 'complete') {
    if (document.getElementById("user_edit_form") !== null) {
      password = document.getElementById('user_password')
      confirmation_password = document.getElementById('user_confirmation_password')
      console.log(password.value)
      console.log(confirmation_password.value)
      password.onchange = validatePassword(password.value, confirmation_password.value)
      confirmation_password.onchange = validatePassword(password.value, confirmation_password.value)
    }
  }
}
validatePassword = function(password, confirmation_password){
  button = document.querySelector('input[type="submit"]')
  button.disabled = (password !== confirmation_password)
}