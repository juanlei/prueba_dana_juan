<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    /* Diseño General */
                    body { font-family: 'Segoe UI', sans-serif; background: #f4f7f6; display: flex; justify-content: center; padding: 50px; }
                    .card { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); width: 80%; }
                    
                    /* Tabla Profesional */
                    table { width: 100%; border-collapse: separate; border-spacing: 0; margin-top: 20px; }
                    th { background-color: #2c3e50; color: white; padding: 15px; text-align: left; text-transform: uppercase; font-size: 0.85em; }
                    td { padding: 15px; border-bottom: 1px solid #eee; color: #555; }
                    
                    /* Efecto hover en filas */
                    tr:hover { background-color: #f9f9f9; }
                    
                    /* Estilo para el estado */
                    .estado-Activo { color: #27ae60; font-weight: bold; }
                    .estado-Mantenimiento { color: #e67e22; font-weight: bold; }
                </style>
            </head>
            <body>
                <div class="card">
                    <h2>Inventario de Hardware</h2>
                    <table>
                        <tr>
                            <th>ID</th><th>Tipo</th><th>Modelo</th><th>Estado</th>
                        </tr>
                        <xsl:for-each select="inventario/equipo">
                            <tr>
                                <td><xsl:value-of select="id"/></td>
                                <td><xsl:value-of select="tipo"/></td>
                                <td><xsl:value-of select="modelo"/></td>
                                <td>
                                    <span class="estado-{estado}">
                                        <xsl:value-of select="estado"/>
                                    </span>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
