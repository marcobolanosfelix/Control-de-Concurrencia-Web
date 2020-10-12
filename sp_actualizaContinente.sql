USE [ventas]
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizaContinente]    Script Date: 07/10/2020 06:03:40 p. m. ******/


ALTER PROCEDURE [dbo].[sp_actualizaContinente]  
  @idcontinente CHAR(1)
AS  
BEGIN  
	DECLARE @idProducto int, @numArticuloVenta int;

		--Bloquear registros del continente para que el segundo SP espere hasta terminar
		SELECT p.ID INTO #tmpTable FROM ventas AS v WITH (UPDLOCK)
		INNER JOIN productos as p ON (v.IdProducto = p.ID)
		WHERE p.Continente = @idcontinente;

		SELECT @idProducto = min(p.ID) FROM ventas AS v
		INNER JOIN productos as p ON (v.IdProducto = p.ID)
		WHERE p.Continente = @idcontinente;
	
		SET @numArticuloVenta = 0;

		WHILE @idProducto IS NOT NULL 
		BEGIN
			SELECT @numArticuloVenta = sum(NoUnidades) FROM ventas WHERE IdProducto = @idProducto;

			UPDATE productos SET existencia = (existencia - @numArticuloVenta)  WHERE ID = @idProducto;

			SELECT @idProducto = min(p.ID) FROM ventas AS v
			INNER JOIN productos as p ON (v.IdProducto = p.ID)
			WHERE p.Continente = @idcontinente and ID > @idProducto;
		END
  PRINT 'FINALIZÓ CONTINENTE: '+ @idcontinente;
END
