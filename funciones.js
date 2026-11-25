/* ====================================== */
/* 1. INICIAR FUNCIONES DE LA PÁGINA */
/* ====================================== */

document.addEventListener("DOMContentLoaded", function () {

    /* ====================================== */
    /* 2. DESPLAZAMIENTO SUAVE */
    /* ====================================== */

    const enlaces = document.querySelectorAll('a[href^="#"]');

    enlaces.forEach(function (enlace) {

        enlace.addEventListener("click", function (evento) {

            const destino = enlace.getAttribute("href");

            if (destino !== "#") {

                const seccion = document.querySelector(destino);

                if (seccion) {

                    evento.preventDefault();

                    seccion.scrollIntoView({
                        behavior: "smooth"
                    });

                }

            }

        });

    });

    /* ====================================== */
    /* 3. AÑO AUTOMÁTICO DEL PIE DE PÁGINA */
    /* ====================================== */

    const anio = document.getElementById("anio-actual");

    if (anio) {
        anio.textContent = new Date().getFullYear();
    }

    /* ====================================== */
    /* 4. MENSAJE DE BIENVENIDA */
    /* ====================================== */

    console.log("Bienvenido a JURIMAI.");
    console.log("Un sueño que florece, un recuerdo que vive para siempre.");

});

/* ====================================== */
/* 5. CARRUSEL DE LIBROS */
/* ====================================== */

function moverCarrusel(boton, direccion) {

    const contenedor = boton.closest(".carrusel-contenedor");
    const carrusel = contenedor.querySelector(".libros-grid");

    carrusel.scrollBy({
        left: direccion * 500,
        behavior: "smooth"
    });

}