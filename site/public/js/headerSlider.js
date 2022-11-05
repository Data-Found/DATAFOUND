const menu = document.querySelector(".nav");

function activeScroll() {
  menu.classList.toggle("ativo", scrollY > 275);
  console.log(scrollY)
}

window.addEventListener("scroll", activeScroll);
