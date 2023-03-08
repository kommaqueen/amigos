var myTab = document.getElementById('pills-tab');
  var myTabContent = document.getElementById('pills-tabContent');

  myTab.addEventListener('click', function (event) {
    event.preventDefault();
    if (event.target.getAttribute('data-bs-toggle') === 'pill') {
      var target = document.querySelector(event.target.getAttribute('data-bs-target'));
      var children = [].slice.call(myTabContent.children);
      children.forEach(function (child) {
        if (child !== target) {
          child.classList.remove('show');
          child.classList.remove('active');
        }
      });
      target.classList.add('show');
      target.classList.add('active');
    }
  });
