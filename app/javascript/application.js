// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const navBring = document.querySelector('.bring-nav');
const navTake = document.querySelector('.take-nav');
const topNav = document.querySelector('.top-nav');

navBring.addEventListener('click', () => {
  topNav.classList.toggle('active');
});

navTake.addEventListener('click', () => {
  topNav.classList.toggle('active');
});
