const menu = document.querySelector(".nav");

function activeScroll() {
  menu.classList.toggle("ativo", scrollY > 650);
  console.log(scrollY)
}

window.addEventListener("scroll", activeScroll);
