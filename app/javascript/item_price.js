window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price")
    const tax = Math.floor(inputValue * 0.1)
    addTaxDom.innerHTML = tax
    const removeTaxDom = document.getElementById("profit")
    removeTaxDom.innerHTML = inputValue - tax
  })
});