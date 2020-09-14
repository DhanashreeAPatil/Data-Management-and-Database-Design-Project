USE [FantasyPremierLeague]
GO

/****** Object:  StoredProcedure [dbo].[dreamteam2]    Script Date: 11/28/2019 4:18:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[dreamteam2] @gameweekId int
as
begin
	(select top (4) p.playerId , p.PlayerName, a.PositionID, a.PositionName, r.Points
	from Players p
	join PlayerPerformance r on r.PlayerID = p.PlayerID
	join Fixtures f on f.FixtureID = r.FixtureID
	join PlayerPosition a on a.positionId = p.positionId
	where a.positionId= 2 and f.GameweekID = @gameweekId)
	Union 
	(select top (4) p.PlayerID , p.PlayerName, a.PositionID, a.PositionName, r.Points
	from Players p
	join PlayerPerformance r on r.PlayerID = p.PlayerID
	join Fixtures f on f.FixtureID = r.FixtureID
	join PlayerPosition a on a.positionId = p.positionId
	where a.PositionId= 3 and f.GameweekID = @gameweekId)
	Union
	(select top (2) p.PlayerID , p.PlayerName, a.PositionID, a.PositionName, r.Points
	from Players p
	join PlayerPerformance r on r.PlayerID = p.PlayerID
	join Fixtures f on f.FixtureID = r.FixtureID
	join PlayerPosition a on a.positionId = p.positionId
	where a.PositionId= 4 and f.GameweekID = @gameweekId)
	Union
	(select top (1) p.PlayerID , p.PlayerName, a.PositionID, a.PositionName, r.Points
	from Players p
	join PlayerPerformance r on r.PlayerID = p.PlayerID
	join Fixtures f on f.FixtureID = r.FixtureID
	join PlayerPosition a on a.positionId = p.positionId
	where a.PositionId= 1 and f.GameweekID = @gameweekId)
	order by r.Points desc
end
GO


exec dreamteam2 @gameweekId = 1