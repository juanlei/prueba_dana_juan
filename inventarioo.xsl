<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                </style>
            </head>
            <body>
                <h2>Inventario de Hardware de Red</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Tipo</th>
                        <th>Modelo</th>
                        <th>Estado</th>
                    </tr>
                    <xsl:for-each select="inventario/equipo">
                        <tr>
                            <td><xsl:value-of select="id"/></td>
                            <td><xsl:value-of select="tipo"/></td>
                            <td><xsl:value-of select="modelo"/></td>
                            <td><xsl:value-of select="estado"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>