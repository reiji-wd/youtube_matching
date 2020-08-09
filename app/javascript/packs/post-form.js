const formBtn = document.querySelector('.post-form-btn');
const postForm = document.querySelector('.post-form');

function formClose() {
  postForm.classList.toggle('close');
}

formBtn.addEventListener('click', formClose);