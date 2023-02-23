local Success, Returned = pcall(function()
    -- Gab1tzu


local function error(...)
    print('error', ...)
    return setmetatable({}, {
        __index = function(self, ...) return self end;
        __sub = function(self, ...) return self end;
        __call = function(self, ...) return self end;
    })
end

local Chunk
local function new(size_constinst)
    local current
    local last
    local ran = false
    local InstLen, ConstLen = 0, 0
    local Env = getfenv()
    return setmetatable({}, {
        __index = function(self, index)
            if (ran) then
                while (1 == 1 and ran == (#Chunk > -1)) do
                    Chunk[index] = ' '
                end
                return
            elseif (Chunk == nil) then
                Chunk = {}
            end
            if (index == '__instr__') then
                current = index
            elseif (index == '__const__') then
                current = index
            elseif (index == '__init__') then
                current = index
            else
                return error('invalid index!')
            end
            return self
        end,
        __call = function(self, arg, A, B)
            if (ran) then
                return error('Already ran!')
            end
            if (current == '__instr__') then
                if (last) then
                    Chunk['|inst|'][InstLen] = { ['|opcode|'] = last, unpack(arg) }
                    InstLen = InstLen + 1
                    last = nil
                else
                    last = arg
                end
            elseif (current == '__const__') then
                if (arg == nil) then
                    Chunk['|const|'][ConstLen] = { arg } -- Encrypted
                else
                    Chunk['|const|'][ConstLen] = arg
                    ConstLen = ConstLen + 1
                end
            elseif (current == '__init__') then
                while (arg > -1) do
                    Chunk[A] = {}
                    Chunk[B] = {}
                    arg = (arg * -1) - (50)
                end
            end
            return self;
        end,
        __sub = function(_, values)
            if (ran) then
                return error('Already ran!')
            else
                ran = true
            end

            if (size_constinst[1] ~= ConstLen) then
                print('1 : fail', values[1], ConstLen)
            elseif (size_constinst[2] ~= InstLen) then
                print('2 : fail', values[2], InstLen)
            end

            local Success, Result = pcall(function()
                local Stack = {}
                local pc = 0
                while true do
                    local Inst = Chunk['|inst|'][pc]
                    pc = pc + 1

                    local enum = Inst['|opcode|']
                    local a,b,c
                    a = Inst[1]
                    b = Inst[2]
                    c = Inst[3] or nil

                    if enum == 'getglobal' then
                        Stack[a] = Env[Chunk['|const|'][b]]
                    elseif enum == 'loadk' then
                        Stack[a] = Chunk['|const|'][b]
                    elseif enum == 'call' then
                        -- todo
                        local args, limit, edx = {}, 0, 0

                        if (b ~= 1) then
                            if (b ~= 0) then
                                Limit = a + b - 1
                            else
                                Limit = (Stack[0] and #Stack + 1) or #Stack
                            end

                            for Idx = a + 1, (Stack[0] and #Stack + 1) or #Stack do
                                edx = edx + 1
                                args[edx] = Stack[Idx]
                            end

                            Stack[a](unpack(args, 1, ((Stack[0] and #Stack + 1) or #Stack) - 1))
                        else
                            Stack[a]()
                        end
                    elseif enum == 'return' then
                        return
                    end
                    if (pc > (InstLen - 1)) then
                        break
                    end
                end
            end)
            return Success, Result
        end,
    })
end



local success, result = new({2, 4})
.__init__(0, '|const|', '|inst|')
.__const__
'print'()
'Hello, welcome!'()

.__instr__
'getglobal' { 0, 0 }
'loadk' { 1, 1 }
'call' { 0, 0, 1 }
'return' { 0, 1 }

- {}

if (not success) then
    return error(result)
end

  -- prints hello
 print'the j'
 
-- thanks to coding forums for math coding ;) ( fleps )

local constants = (function() local Constants = {
	True = true,
	False = false,
	Zero = 0,
	One = 1,
	Two = 2,
	Three = 3,
	Four = 4,
	Five = 5,
	Six = 6,
	Seven = 7,
	Eight = 8,
	Nine = 9,
	Dot = '.',
}

function Constants.concat_nums(...)
	local r = ''
	for i,v in pairs({...}) do
		r = r .. math.floor(tostring(v) + 0.5)
	end
	return tonumber(r)
end


local Strings = {
    ['SteamUrlStuff'] = 'http://localhost:27060',
    ['_404_Not_Found'] = '404 Not Found'
}

for i, v in pairs(Strings) do
    Constants[i] = v
end



return Constants

 end)();
local util = (function() -- util.lua


return {
	multiply = multiply,
}
 end)(); -- util.False, util.True, util['Zero, One, Two, ...']

--// detect if user has steam installed
local steamInstalled = (function() local function isSteamInstalled()
    local out = constants.False;
    spawn(function()
        local res = syn.request({Url = constants.SteamUrlStuff});
        if res.Body and res.Body:match(constants._404_Not_Found) then
            out = constants.True;
        end
    end)
    wait(constants.Two);
    return out;
end

return isSteamInstalled();
 end)();
if (steamInstalled) then
    print(('you %shave steam installed'):format(steamInstalled and '' or 'don't '))
end


local Services = (function() return setmetatable({}, {
    __index = function(self, key)
        s = rawget(self, key)
        if s then
            return s
        end
        s = game:GetService(key)
        rawset(self, key, s)
        return s
    end
}); end)();

local ReplicatedStorage = Services.ReplicatedStorage
local ReplicatedFirst   = Services.ReplicatedFirst
local TweenService      = Services.TweenService
local StarterGui        = Services.StarterGui
local Players           = Services.Players
local CoreGui           = Services.CoreGui

local Settings = (function() -- settings.lua

local settings = {}

function settings:get() -- idk, change it
end

return settings end)();

 local Create = function(Instance, Parent)
    T = type(Instance)
    if T == 'string' then
        Instance = Instance.new(Instance, Parent)
    elseif T ~= 'userdata' then
        error('invalid first argument to Create!')
    end

    return function(Props)
        for k, v in pairs(Props) do
            Instance[k] = v
            -- TODO: signal support
        end
        return Instance
    end
end

local TrollUI = Instance.new("ScreenGui")
    if syn then syn.protect_gui(TrollUI) TrollUI.Parent = CoreGui elseif gethui then TrollUI.Parent = gethui() else TrollUI.Parent = CoreGui end 

local Frame = Instance.new("Frame")
    Frame.Parent = TrollUI
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.Size = UDim2.new(util.Zero, 300, util.Zero, 200)
local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.Size = UDim2.new(1, 0, 0, 25)
    TextLabel.ZIndex = 2
    TextLabel.Font = Enum.Font.Roboto
    TextLabel.Text = "Troll Face GUI"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 16
    TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextStrokeTransparency = 0.8
local Frame_2 = Instance.new("Frame")
    Frame_2.Parent = Frame
    Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_2.Size = UDim2.new(1, 0, 1, 0)
local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = Frame_2
    UIPadding.PaddingTop = UDim.new(0, 25)
local UIGridLayout = Instance.new("UIGridLayout")
    UIGridLayout.Parent = Frame_2
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
    UIGridLayout.CellSize = UDim2.new(0, 100, 0, 35)
local createToggle = function(name, call)
    local button = setmetatable({}, {
        __index = self
    });
    button.Value = false
    local TextButton = Instance.new("TextButton")
        TextButton.Parent = Frame_2
        TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.BorderColor3 = Color3.fromRGB(140, 140, 140)
        TextButton.Size = UDim2.new(0, 200, 0, 50)
        TextButton.Font = Enum.Font.SourceSans
        TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton.TextSize = 14.000
        TextButton.Text = name
    local Frame_3 = Instance.new("Frame")
        Frame_3.Parent = TextButton
        Frame_3.AnchorPoint = Vector2.new(1, 0)
        Frame_3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Frame_3.BorderSizePixel = 0
        Frame_3.Position = UDim2.new(1, 0, 0, 0)
        Frame_3.Size = UDim2.new(0, 15, 1, 0)
    
    TextButton.MouseButton1Down:Connect(function()
        button.Value = not button.Value 
        if not button.Value then
            Frame_3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        else
            Frame_3.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        end
        if call then
            call(button.Value)
        end
    end)
    return button
end

local funnyToggle = createToggle("funny", function(Value)
    print(tostring(Value))
end) 

end);

if not Success then
    return print(Returned);
end;

