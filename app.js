// Variable global para almacenar los datos una vez descargados
let datosRed = [];

// Referencias al DOM
const tbody = document.getElementById('cuerpoTabla');
const buscador = document.getElementById('buscador');
const filtroTipo = document.getElementById('filtroTipo');
const contador = document.getElementById('contadorEquipos');

// Función asíncrona para obtener los datos del archivo JSON local
async function cargarDatos() {
    try {
        const respuesta = await fetch('datos.json');
        
        // Comprobamos si la petición falló
        if (!respuesta.ok) {
            throw new Error(`HTTP error! status: ${respuesta.status}`);
        }
        
        // Convertimos la respuesta a JSON y la guardamos
        datosRed = await respuesta.json();
        renderizarTabla(datosRed); // Renderizamos por primera vez
        
    } catch (error) {
        console.error("Error al cargar el JSON:", error);
        tbody.innerHTML = `<tr><td colspan="6" class="empty-state">Error al cargar los datos. Verifica la consola o tu servidor local.</td></tr>`;
    }
}

// Función principal para renderizar la tabla
function renderizarTabla(datos) {
    tbody.innerHTML = ''; 
    contador.textContent = datos.length; 

    if (datos.length === 0) {
        tbody.innerHTML = `<tr><td colspan="6" class="empty-state">No se encontraron equipos que coincidan con la búsqueda.</td></tr>`;
        return;
    }

    datos.forEach(equipo => {
        const fila = document.createElement('tr');
        const claseBadge = equipo.estado === 'Activo' ? 'badge activo' : 'badge inactivo';

        fila.innerHTML = `
            <td><strong>${equipo.id}</strong></td>
            <td>${equipo.tipo}</td>
            <td>${equipo.marca} ${equipo.modelo}</td>
            <td><code>${equipo.ip}</code></td>
            <td>${equipo.ubicacion}</td>
            <td><span class="${claseBadge}">${equipo.estado}</span></td>
        `;
        tbody.appendChild(fila);
    });
}

// Función para filtrar los datos combinando Búsqueda + Select
function aplicarFiltros() {
    const textoBusqueda = buscador.value.toLowerCase();
    const tipoSeleccionado = filtroTipo.value;

    const datosFiltrados = datosRed.filter(equipo => {
        const coincideTexto = 
            equipo.marca.toLowerCase().includes(textoBusqueda) || 
            equipo.modelo.toLowerCase().includes(textoBusqueda) ||
            equipo.ip.includes(textoBusqueda);
        
        const coincideTipo = tipoSeleccionado === "Todos" || equipo.tipo === tipoSeleccionado;

        return coincideTexto && coincideTipo;
    });

    renderizarTabla(datosFiltrados);
}

// Asignar Eventos
buscador.addEventListener('input', aplicarFiltros);
filtroTipo.addEventListener('change', aplicarFiltros);

// Iniciar la carga al abrir la página
document.addEventListener('DOMContentLoaded', cargarDatos);