const pay = () => {
  const price = document.getElementById('item-price');
  const priceContent = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  price.addEventListener('input', updateValue);

  function updateValue () {
    priceContent.textContent = price.value * 0.1 ;
    profit.textContent = price.value - (price.value * 0.1) ;
  };
};

window.addEventListener("turbolinks:load", pay);