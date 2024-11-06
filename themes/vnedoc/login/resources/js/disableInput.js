window.addEventListener('load', () => {
  const lgUsernameInput = document.getElementById("login-username-input");
  const lgUsernameButton = document.getElementById("login-username-button");
  // Check xem nếu khởi tạo page mà có input thì sẽ không bị disabled;
  lgUsernameButton.disabled = !lgUsernameInput.value.trim();
  lgUsernameInput.addEventListener("input", function () {
      // Enable button nếu input có giá trị, ngược lại disable
      lgUsernameButton.disabled = !this.value.trim();
  });
})

