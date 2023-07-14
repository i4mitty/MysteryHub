local plrs = game:GetService("Players")

local UI = game:GetObjects("rbxassetid://7437010836")[1]

local cool = {
    {3878503910, "━━━ ★ Superior ★ ━━━", 2},
    {3531401982, "━━━ ★ Designer ★ ━━━", 2},
    {4321659797, "━━━ ★ Premium ★ ━━━", 2},
    {180452588, "━━━ ★ Premium ★ ━━━", 2},
    {1574328322, "━━━ ★ Premium ★ ━━━", 2},
    {4222612058, "━━━ ★ Premium ★ ━━━", 2},
    {4171996484, "━━━ ★ Premium ★ ━━━", 2},
    {3734161981, "━━━ ★ Sexy ★ ━━━", 2},
    {4455703917, "━━━ ★ Premium ★ ━━━", 2},
    {2843968848, "━━━ ★ Premium ★ ━━━", 2},
    {45627963, "━━━ ★ Premium ★ ━━━", 2},
    {45627963, "━━━ ★ Premium ★ ━━━", 2},
    {1745077602, "━━━ ★ Premium ★ ━━━", 2},
}

local function isCool(player)
    local isCool = false
    local tag
    local num

    for i, v in next, cool do
        if player.UserId == v[1] then
            isCool = true
            tag = v[2]
            num = v[3]
        end
    end

    return {isCool, tag, num}
end

local function ApplyTag(player, text, num)
    local tag = UI:Clone()
    tag.Nameplate.Text = text
    if num == 2 then
        coroutine.wrap(
            function()
                while tag ~= nil do
                    wait()
                    local color = Color3.fromHSV(math.random() % 5 / 5, 1, 1)
                    tag.Nameplate.TextColor3 = color
                end
            end
        )()
    end

    tag.Parent = player.Character:WaitForChild("Head")
end


for _, v in next, game.Players:GetPlayers() do
    if isCool(v)[1] then
        ApplyTag(v, isCool(v)[2], isCool(v)[3])

        v.CharacterAdded:Connect(
            function()
                ApplyTag(v, isCool(v)[2], isCool(v)[3])
            end
        )
    end
end

game.Players.PlayerAdded:Connect(
    function(plr)
        if isCool(plr)[1] then
            plr.CharacterAdded:Connect(
                function()
                    ApplyTag(plr, isCool(plr)[2], isCool(plr)[3])
                end
            )
        end
    end)
