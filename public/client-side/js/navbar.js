let ecomNavSearchForm = document.querySelector(".ecomNav-search-form");
let ecomNavHeader = document.querySelector(".ecomNav-header");
const moreButtons = document.querySelectorAll(".morebtn");



let ecomNavShoppingCart = document.querySelector(".ecomNav-shopping-cart");

document.querySelector("#ecomNav-cart-btn").onclick = () => {
  ecomNavShoppingCart.classList.toggle("active");
  ecomNavLoginForm.classList.remove("active");
  ecomNavNavbar.classList.remove("active");
};

let ecomNavLoginForm = document.querySelector(".ecomNav-login-form");

// Select all elements with the class 'morebtn'

// Iterate over each element in the NodeList
moreButtons.forEach(button => {
    button.addEventListener("click", () => {
        // Toggle the 'active' class on the ecomNavLoginForm element
        ecomNavLoginForm.classList.toggle("active");
        // Remove the 'active' class from ecomNavShoppingCart and ecomNavNavbar elements
        ecomNavShoppingCart.classList.remove("active");
        ecomNavNavbar.classList.remove("active");
    });
});


let ecomNavNavbar = document.querySelector(".ecomNav-navbar");

document.querySelector("#ecomNav-menu-btn").onclick = () => {
  ecomNavNavbar.classList.toggle("active");

  ecomNavShoppingCart.classList.remove("active");
  ecomNavLoginForm.classList.remove("active");
};



