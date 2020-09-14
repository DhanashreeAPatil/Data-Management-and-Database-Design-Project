create procedure [dbo].[insertUser] (@username varchar(50), @email varchar(50), @password varchar(50))
AS
BEGIN
begin try
insert into [dbo].[Users] (userName, email, [password]) values(@username, @email, Cast(@password as varbinary(max)))
end try

begin catch
print 'Error';
end catch

end
GO