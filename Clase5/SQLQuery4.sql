USE [master]

GO

CREATE SERVER AUDIT [Audit-20230305-151616]
TO FILE 
(	FILEPATH = N'F:\TMP\AuditSQL'
	,MAXSIZE = 2 GB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
) WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE)

GO


