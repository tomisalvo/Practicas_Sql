CREATE PROCEDURE AsignarTipoCUIT
    @DNI NVARCHAR(20),
    @TipoPersona NVARCHAR(20),
    @TipoCUIT NVARCHAR(50) OUTPUT
AS
BEGIN
    SET @TipoCUIT = 
        CASE
            WHEN @TipoPersona LIKE '20%' THEN 'M'
            WHEN @TipoPersona LIKE '30%' THEN 'PJ'
            WHEN @TipoPersona LIKE '23%' THEN 'E'
            WHEN @TipoPersona LIKE '27%' THEN 'F'
            ELSE 'Tipo de CUIT no reconocido'
        END;
END;

CREATE PROCEDURE UnirAtributos
    @DNI NVARCHAR(20),
    @TipoPersona NVARCHAR(20)
AS
BEGIN
    SELECT CONCAT(@DNI, '', @TipoPersona) AS CUIT;
END;

DECLARE @DNI NVARCHAR(20) = '39122507';
DECLARE @TipoCUIT NVARCHAR(50);
DECLARE @TipoPersona NVARCHAR(20) = '30';

EXEC UnirAtributos @TipoPersona, @DNI;
EXEC AsignarTipoCUIT @DNI, @TipoCUIT OUTPUT;

SELECT @DNI AS Documento, @TipoCUIT AS 'Tipo Persona';
