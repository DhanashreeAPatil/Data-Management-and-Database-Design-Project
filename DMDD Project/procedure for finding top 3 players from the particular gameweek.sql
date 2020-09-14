USE [FantasyPremierLeague]
GO

/****** Object:  StoredProcedure [dbo].[topplayers]    Script Date: 11/28/2019 4:11:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[top-players] @gameweek int
as
begin
select top (3) p.PlayerID, R.PlayerName, p.Points 
from PlayerPerformance p
join Players R on R.PlayerID = p.PlayerID
join Fixtures f on f.FixtureID = p.FixtureID
where f.GameweekID =@gameweek
end
GO

exec [top-players] @gameweek = 2



