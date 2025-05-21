document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".temaValtasGomb button").forEach(gomb => {
        gomb.addEventListener("click", () => {
            const szam = gomb.dataset.tema;
            document.body.className = `tema${szam}`;
        });
    });
});
