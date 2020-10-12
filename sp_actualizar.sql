drop PROCEDURE sp_actualizaContinente;
go
use ventas;
go
--select * from productos as p inner join ventas as v on v.idProducto=p.ID;
CREATE PROCEDURE [dbo].[sp_actualizaContinente]
  @idcontinente CHAR(1)
AS
BEGIN
    DECLARE @idProducto int, @numArticuloVenta int;

    --IF NOT EXISTS (SELECT continente FROM ctlSemaforo WITH (NOLOCK) WHERE continente = @idcontinente)
    --BEGIN
        --INSERT INTO ctlSemaforo  VALUES (@idcontinente);

        SELECT @idProducto = min(p.id) FROM ventas AS v
        INNER JOIN productos as p ON (v.idProducto = p.id)
        WHERE p.continente = @idcontinente;

        SET @numArticuloVenta = 0;

        WHILE @idProducto IS NOT NULL 
        BEGIN
            SELECT @numArticuloVenta = sum(noUnidades) FROM ventas WHERE idProducto = @idProducto;

            UPDATE productos SET existencia = (existencia - @numArticuloVenta)  WHERE id = @idProducto;

            SELECT @idProducto = min(p.id) FROM ventas AS v
            INNER JOIN productos as p ON (v.idProducto = p.id)
            WHERE p.continente = @idcontinente and id > @idProducto;
        END

       -- DELETE FROM ctlSemaforo WHERE continente = @idcontinente;
    
	/*
    ELSE
    BEGIN
        PRINT 'Se rechazó operación en continente: '+ @idcontinente;
    END

  PRINT 'FINALIZÓ CONTINENTE: '+ @idcontinente;
  */
END