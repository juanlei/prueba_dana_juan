<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body { font-family: 'Segoe UI', sans-serif; background: #f3f4f6; padding: 40px; display: flex; justify-content: center; }
                    .card { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 90%; max-width: 1000px; }
                    h2 { color: #1e3a8a; margin-bottom: 20px; border-bottom: 2px solid #e5e7eb; padding-bottom: 10px; }
                    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
                    th { background-color: #1e3a8a; color: white; padding: 12px; text-align: left; }
                    td { padding: 12px; border-bottom: 1px solid #e5e7eb; color: #374151; }
                    tr:hover { background-color: #f9fafb; }
                    .badge { padding: 4px 12px; border-radius: 9999px; font-size: 0.85em; font-weight: bold; color: white; }
                    .estado-Activo { background-color: #16a34a; }
                    .estado-Mantenimiento { background-color: #d97706; }
                    .estado-Inactivo { background-color: #6b7280; }
                </style>
            </head>
            <body>
                <div class="card">
                    <h2>Inventario de Hardware - <xsl:value-of select="inventario/metadata/empresa"/></h2>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Tipo</th>
                            <th>Marca y Modelo</th>
                            <th>IP Gestión</th>
                            <th>Estado</th>
                        </tr>
                        <xsl:for-each select="inventario/equipos/equipo">
                            <tr>
                                <td><strong><xsl:value-of select="@id"/></strong></td>
                                <td><xsl:value-of select="tipo"/></td>
                                <td><xsl:value-of select="marca"/> - <xsl:value-of select="modelo"/></td>
                                <td><xsl:value-of select="red/ip_gestion"/></td>
                                <td>
                                    <span class="badge estado-{mantenimiento/estado}">
                                        <xsl:value-of select="mantenimiento/estado"/>
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