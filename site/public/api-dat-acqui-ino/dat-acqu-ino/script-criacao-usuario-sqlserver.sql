-- o script abaixo deverá ser executado no Banco de Dados de Produção - SQL Server
-- estes comandos criam um usuário que tem permissão de ESCRITA/WRITER.
-- como os dados capturados pelo Arduino serão INSERIDOS/ESCRITOS/WRITTEN no banco de dados,
-- é importante que sejam inseridos com as credenciais de acordo.

CREATE USER [root_datafound]
WITH PASSWORD = '#Gfgrupo6',
DEFAULT_SCHEMA = bdo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'adm_datafound'
