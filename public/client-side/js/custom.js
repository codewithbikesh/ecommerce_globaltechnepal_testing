
const handleResize = () => {
    if (window.innerWidth <= 991) {
let fltrBtn = document.querySelector(".fltrBtn");
let body = document.querySelector("body");

let ssllll = document.querySelector(".ssllll");
let fltrsStatus = 0;
ssllll.style.display = "none";

// Function to show the filter element
const showFilter = () => {
    ssllll.style.display = "flex";
    ssllll.style.position = "fixed";
    ssllll.style.zIndex = "9";
    ssllll.style.background = "#f0eeed";
    ssllll.style.top = "101px";
    console.log("Filter shown");
};

// Function to hide the filter element
const hideFilter = () => {
    let ssllll = document.querySelector(".ssllll");
    ssllll.style.display = "none";
};


fltrBtn.addEventListener("click", (event) => {
    if (fltrsStatus === 0) {
        fltrsStatus = 1;
        event.stopPropagation();
        showFilter();
    } else {
        hideFilter();
        fltrsStatus = 0;
    }
});


body.addEventListener("click", (event) => {
    if (event.target.tagName === "SPAN") {
    } else {
        hideFilter();
    }
});
    } 
    else{
            let ssllll = document.querySelector(".ssllll");
    ssllll.style.position = "relative";
    ssllll.style.top = "0px";
    ssllll.style.display = "block";

    }
};


handleResize();


window.addEventListener("resize", handleResize);