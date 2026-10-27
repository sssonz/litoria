// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener("turbo:load", () => {
  const fandoms = document.querySelectorAll(".fandom");
  const preview = document.querySelector(".fandom-preview");

  if (!fandoms.length || !preview) return;

  const image = preview.querySelector("img");
  const canHover = window.matchMedia("(min-width: 768px) and (hover: hover) and (pointer: fine)");

  function movePreview(event) {
    const width = 250;
    const height = 370;
    const gap = 24;
    const margin = 16;

    let x = event.clientX + gap;
    let y = event.clientY - height / 2;

    if (x + width + margin > window.innerWidth) {
      x = event.clientX - width - gap;
    }

    x = Math.max(margin, Math.min(x, window.innerWidth - width - margin));
    y = Math.max(margin, Math.min(y, window.innerHeight - height - margin));

    preview.style.transform = `translate3d(${x}px, ${y}px, 0)`;
  }

  fandoms.forEach((fandom) => {
    fandom.addEventListener("mouseenter", (event) => {
      if (!canHover.matches) return;

      image.src = fandom.dataset.image;
      movePreview(event);
      preview.classList.add("active");
    });

    fandom.addEventListener("mousemove", (event) => {
      if (!canHover.matches) return;

      movePreview(event);
    });

    fandom.addEventListener("mouseleave", () => {
      preview.classList.remove("active");
    });
  });

  image.addEventListener("error", () => {
    preview.classList.remove("active");
  });
});


document.addEventListener("turbo:load", () => {
  const audience = document.querySelector(".audience");

  if (!audience) return;

  const buttons = audience.querySelectorAll(".audience-btn");
  const readerCards = audience.querySelector("#reader-cards");
  const writerCards = audience.querySelector("#writer-cards");

  if (!readerCards || !writerCards) return;

  buttons.forEach((button) => {
    button.addEventListener("click", () => {
      const isReader = button.dataset.audience === "reader";

      readerCards.hidden = !isReader;
      writerCards.hidden = isReader;

      buttons.forEach((item) => {
        const active = item === button;

        item.classList.toggle("active", active);
        item.setAttribute("aria-pressed", String(active));
      });
    });
  });
});
