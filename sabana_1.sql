/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ol.[OperacionId] as operacion_id
      ,ol.[Fecha] as fecha_operacion
      ,ol.[OperadorLibranzaId] as operador_libranza_id
	  ,op.Codigo as codigo_operador
	  ,op.RazonSocial as operador_libranza
	  ,op.NombreCorto as nombre_corto_operador
	  ,op.Descripcion as descripcion_operador
	  ,op.Inactivo as inactivo_operador
      ,ol.[AfiliadoId] as afiliado_id
	  ,t.Codigo as tipo_documento_afiliado
	  ,a.NDI as numero_documento_afiliado
	  ,a.Nombres as nombre_afiliado
	  ,a.Apellidos as apellido_afiliado
	  ,a.email as email_afiliado
	  ,a.Movil as movil_afiliado
	  ,m.Codigo as codigo_municipio_afiliado
	  ,m.Nombre as municipio_afiliado
	  ,d.Codigo as codigo_departamento_afiliado
	  ,d.Nombre as departamento_afiliado
	  ,a.Inactivo as inactivo_afiliado
      ,ol.[Plazo] as plazo_solicitud
      ,ol.[Monto] as monto_solicitud
      ,ol.[ValorCuota] as valor_cuota_solicitud
      ,ol.[EstadoSolicitud] as estado_solicitud
	  ,case when ol.[EstadoSolicitud]=0 then 'Solicitada' 
			when ol.[EstadoSolicitud]=1 then 'En Revisión'
			when ol.[EstadoSolicitud]=2 then 'Aprobada'
			when ol.[EstadoSolicitud]=3 then 'Rechazada' end as estado_operacion
  FROM [p01].[dbo].[OperacionesLibranza] ol 
		inner join [p01].[dbo].Afiliados a on ol.AfiliadoId=a.AfiliadoId
		inner join [p01].[dbo].OperadoresLibranza op on ol.OperadorLibranzaId=op.OperadorId
		inner join [p01].[dbo].TDIs t on t.TDIId=a.TDIId
		inner join [p01].[dbo].Municipios m on a.MunicipioResidenciaId=m.MunicipioId
		inner join [p01].[dbo].Departamentos d on m.DepartamentoId=d.DepartamentoId