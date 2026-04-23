<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body { font-family: 'Segoe UI', sans-serif; margin: 40px; background: #f4f7f6; }
                    .card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    th { background: #2c3e50; color: white; padding: 12px; }
                    td { padding: 12px; border-bottom: 1px solid #eee; }
                    .status-Activo { color: green; font-weight: bold; }
                    .status-Mantenimiento { color: orange; font-weight: bold; }
                </style>
            </head>
            <body>
                <div class="card">
                    <h1>Inventario: <xsl:value-of select="inventario/metadata/empresa"/></h1>
                    <table>
                        <tr><th>ID</th><th>Modelo</th><th>Tipo</th><th>Estado</th></tr>
                        <xsl:for-each select="inventario/equipos/equipo">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="modelo"/></td>
                                <td><xsl:value-of select="tipo"/></td>
                                <td>
                                    <span class="status-{estado}">
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
