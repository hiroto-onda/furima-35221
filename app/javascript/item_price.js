window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxPriceInput = document.getElementById("add-tax-price");
  const profitInput = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
    const addTaxPriceNumber = document.getElementById("add-tax-price")
    const value_result = inputValue * 0.1
    profitInput.innerHTML =  (Math.floor(inputValue - value_result));
    addTaxPriceInput.innerHTML =  (Math.floor(value_result));
    })
});