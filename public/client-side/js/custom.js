

let moreActionBtnButton = document.querySelector(".moreActionBtnButton")

// Account page sidebar hide show | when click on "Account Menu" toogle sidebar opacity
moreActionBtnButton.addEventListener("click", ()=>{
    let leftSideBar = document.querySelector(".leftSideBar")
    leftSideBar.classList.toggle("sliderHide")
    leftSideBar.classList.toggle("sliderShow")
    
})




    // Hide sidebar when clicking anywhere in the document except it's own area
    document.addEventListener('click', (event) => {
    let leftSideBar = document.querySelector(".leftSideBar")
        if (!leftSideBar.contains(event.target) && event.target.tagName!=="BUTTON") {
              leftSideBar.classList.add("sliderHide")

        }
    });

    // Prevent hiding sidebar when clicking inside it
    leftSideBar.addEventListener('click', (event) => {
        event.stopPropagation(); // Prevent the click from reaching the document
    });







