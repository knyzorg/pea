for (let a of document.querySelectorAll(".navigation ul li a")) {
    a.addEventListener("click", function () {
        if (this.classList.contains("open")) {
            this.classList.remove("open");
        } else {
            this.classList.add("open");
        }
    });
}