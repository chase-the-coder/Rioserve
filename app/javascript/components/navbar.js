const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-rioserve');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-rioserve-black');
      } else {
        navbar.classList.remove('navbar-rioserve-black');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
