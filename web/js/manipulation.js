document.querySelector('.scroll-button').addEventListener('click', function(e) {
  e.preventDefault();
  document.querySelector('#section-1').scrollIntoView({ 
    behavior: 'smooth' 
  });
});
