const cardImgs = document.querySelectorAll('.card img');

for (let img of cardImgs) {
    img.addEventListener('click', function () {
        this.classList.toggle("img-scale");
    })
}