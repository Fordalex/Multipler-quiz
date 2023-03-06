document.addEventListener('DOMContentLoaded', () => {
  let colourPickers = document.querySelectorAll('.colour-picker');
  colourPickers.forEach((colourPicker) => {
    colourPicker.addEventListener('click', (e) => {
      colourPicker.forEach((cp) => { cp.classList.remove('active'); });
      colourPicker.classList.toggle('active');
    });
  });
});
