document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profitDom = document.getElementById('profit');

  if (priceInput) {
      priceInput.addEventListener('input', () => {
          const inputValue = priceInput.value;

          if (inputValue >= 300 && inputValue <= 9999999) {
              const tax = Math.floor(inputValue * 0.1);
              const profit = Math.floor(inputValue - tax);
              addTaxPrice.innerHTML = tax;
              profitDom.innerHTML = profit;
          } else {
              addTaxPrice.innerHTML = '0';
              profitDom.innerHTML = '0';
          }
      });
  }
});