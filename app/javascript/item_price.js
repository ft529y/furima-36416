function money () {
const inputMoney = document.getElementById("item-price");
const taxPrice = document.getElementById("add-tax-price");
const salesProfit = document.getElementById("profit")
inputMoney.addEventListener("input", () => {
  const inputValue = inputMoney.value;
  const result = inputValue * 0.1;
  taxPrice.innerHTML = Math.floor(result).toLocaleString();
  salesProfit.innerHTML = Number( inputValue - Math.floor(result)).toLocaleString();

});
};

window.addEventListener('load', money);