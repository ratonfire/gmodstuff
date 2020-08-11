local targetPlayer=nil
local target=nil
local eyeTrace=nil
local spawnPoint=nil
hook.Add("PlayerSay","name",function(ply,str)
	for k,v in pairs(player.GetAll()) do
		if str~=v:GetName() then
            targetPlayer=v
        end
		if str==v:GetName() then
			target=v
		end
		if str=="!spawnpoint" and target~=nil then 
			local eyet=target:GetEyeTrace()
			spawnPoint=eyet.HitPos
	    end
	end
end)
hook.Add("Think","test",function()
	if target~=nil then
	eyeTrace=target:GetEyeTrace()
    end
	if targetPlayer~=nil and target~=nil then
	    if target:KeyPressed(8192) then
	    	targetPlayer:SetPos(target:GetPos())
	    end
	    if target:KeyPressed(IN_ATTACK2) then
	    	target:SetPos(eyeTrace.HitPos)
	    end
	    if target:KeyPressed(IN_ATTACK) and spawnPoint~=nil then
	    	target:SetPos(spawnPoint)
	    end
    end
end)
