let datosRed = [];

const tbody = document.getElementById('cuerpoTabla');
const buscador = document.getElementById('buscador');
const filtroTipo = document.getElementById('filtroTipo');
const contador = document.getElementById('contadorEquipos');
const btnLimpiar = document.getElementById('btnLimpiar');

// Función asíncrona para obtener los datos del JSON
async function cargarDatos() {
    try {
        const respuesta = await fetch('datos.json');
        if (!respuesta.ok) throw new Error(`HTTP error! status: ${respuesta.status}`);
        
        datosRed = await respuesta.json();
        renderizarTabla(datosRed);
        
    } catch (error) {
        console.error("Error al cargar el JSON:", error);
        tbody.innerHTML = `<tr><td colspan="6" class="empty-state">Error al cargar los datos. ¿Estás usando Live Server?</td></tr>`;
    }
}

// Función principal para renderizar la tabla
function renderizarTabla(datos) {
    tbody.innerHTML = ''; 
    contador.textContent = datos.length; 

    if (datos.length === 0) {
        tbody.innerHTML = `<tr><td colspan="6" class="empty-state">No se encontraron equipos.</td></tr>`;
        return;
    }

    datos.forEach(equipo => {
        const fila = document.createElement('tr');
        
        // Lógica de colores e iconos para el Badge
        let claseBadge = '';
        let icono = '';
        
        if (equipo.estado === 'Activo') {
            claseBadge = 'badge activo';
            icono = '✔️';
        } else if (equipo.estado === 'Mantenimiento') {
            claseBadge = 'badge mantenimiento';
            icono = '🔧';
        } else {
            claseBadge = 'badge inactivo';
            icono = '❌';
        }

        fila.innerHTML = `
            <td>${equipo.id}</td>
            <td>${equipo.tipo}</td>
            <td>${equipo.marca} ${equipo.modelo}</td>
            <td>${equipo.ip}</td>
            <td>${equipo.ubicacion}</td>
            <td><span class="${claseBadge}">${equipo.estado} ${icono}</span></td>
        `;
        tbody.appendChild(fila);
    });
}

// Función para filtrar los datos
function aplicarFiltros() {
    const textoBusqueda = buscador.value.toLowerCase();
    const tipoSeleccionado = filtroTipo.value;

    const datosFiltrados = datosRed.filter(equipo => {
        const textoFila = `${equipo.marca} ${equipo.modelo} ${equipo.ip}`.toLowerCase();
        const coincideTexto = textoFila.includes(textoBusqueda);
        const coincideTipo = tipoSeleccionado === "Todos" || equipo.tipo === tipoSeleccionado;

        return coincideTexto && coincideTipo;
    });

    renderizarTabla(datosFiltrados);
}

// Limpiar buscador
btnLimpiar.addEventListener('click', () => {
    buscador.value = '';
    filtroTipo.value = 'Todos';
    aplicarFiltros();
});

// Asignar Eventos
buscador.addEventListener('input', aplicarFiltros);
filtroTipo.addEventListener('change', aplicarFiltros);

// Iniciar
document.addEventListener('DOMContentLoaded', cargarDatos);