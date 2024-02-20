// 金額を入力した数値をpriceInputという変数に格納する
window.addEventListener('turbo:load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
const inputValue = priceInput.value;
const addTaxDom = document.getElementById("add-tax-price")
addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
const addProfitDom = document.getElementById("profit")
addProfitDom.innerHTML = Math.floor(priceInput.value - (priceInput.value * 0.1));
})
});


