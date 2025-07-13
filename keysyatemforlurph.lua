--// ✅ Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--// ✅ Config
local KEY_URL = "https://raw.githubusercontent.com/obama928292/Side-script/refs/heads/main/Ajjan%20key%20system"
local SCRIPT_URL = "https://raw.githubusercontent.com/AXSHUB/I-know-you-are-her-smartass/refs/heads/main/Protected_3253807138680434.lua.txt"
local LINKVERTISE_URL = "https://link-center.net/1363810/9Xd0VG3f1RIQ"
local KEY_FILE = "ajjan_key.txt"

--// ✅ Notification Function
local function notify(success, message)
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = success and "✅ Verified" or "❌ Invalid",
			Text = message,
			Duration = 4
		})
	end)
end

--// ✅ Create GUI base before auto verify check
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "LockedKeySystem"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Elastic), {
	Size = UDim2.new(0, 400, 0, 250),
	Position = UDim2.new(0.5, -200, 0.5, -125)
}):Play()

RunService.RenderStepped:Connect(function()
	Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
end)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "Ajjan Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold

local Notify = Instance.new("TextLabel", Frame)
Notify.Size = UDim2.new(1, 0, 0, 30)
Notify.Position = UDim2.new(0, 0, 0.5, 0)
Notify.BackgroundTransparency = 1
Notify.Text = ""
Notify.TextColor3 = Color3.fromRGB(255, 0, 0)
Notify.TextScaled = true
Notify.Font = Enum.Font.GothamBold
Notify.Visible = false

--// ✅ Auto Verify Check
local function autoVerify()
	if isfile(KEY_FILE) then
		local savedKey = readfile(KEY_FILE):match("^%s*(.-)%s*$")
		local success, result = pcall(function()
			return game:HttpGet(KEY_URL)
		end)
		if success then
			local fetchedKey = result:match("^%s*(.-)%s*$")
			if savedKey == fetchedKey then
				notify(true, "Key auto verified!")

				-- Show GUI loading message
				Notify.Text = "✅ Key Verified -- Loading..."
				Notify.TextColor3 = Color3.fromRGB(80, 255, 80)
				Notify.Visible = true
				wait(2)

				-- Close GUI with animation
				TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
					Size = UDim2.new(0, 0, 0, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				}):Play()

				wait(0.4)
				ScreenGui:Destroy()
				loadstring(game:HttpGet(SCRIPT_URL))()
				return true
			else
				delfile(KEY_FILE)
			end
		end
	end
	return false
end

-- Try auto verify first
if autoVerify() then return end

--// ✅ GUI if auto verify fails
local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0.85, 0, 0, 40)
TextBox.Position = UDim2.new(0.075, 0, 0.2, 0)
TextBox.PlaceholderText = "Enter Key Here"
TextBox.Text = ""
TextBox.TextScaled = true
TextBox.Font = Enum.Font.Gotham
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.BorderSizePixel = 0
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)

local CheckButton = Instance.new("TextButton", Frame)
CheckButton.Size = UDim2.new(0.4, 0, 0, 40)
CheckButton.Position = UDim2.new(0.05, 0, 0.7, 0)
CheckButton.Text = "Check Key"
CheckButton.TextScaled = true
CheckButton.Font = Enum.Font.GothamSemibold
CheckButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
CheckButton.TextColor3 = Color3.new(1, 1, 1)
CheckButton.BorderSizePixel = 0
Instance.new("UICorner", CheckButton).CornerRadius = UDim.new(0, 8)

CheckButton.MouseEnter:Connect(function()
	TweenService:Create(CheckButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		BackgroundColor3 = Color3.fromRGB(0, 200, 0),
		Size = UDim2.new(0.4, 0, 0, 45)
	}):Play()
end)
CheckButton.MouseLeave:Connect(function()
	TweenService:Create(CheckButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		BackgroundColor3 = Color3.fromRGB(0, 170, 0),
		Size = UDim2.new(0.4, 0, 0, 40)
	}):Play()
end)

local GetKeyButton = Instance.new("TextButton", Frame)
GetKeyButton.Size = UDim2.new(0.4, 0, 0, 40)
GetKeyButton.Position = UDim2.new(0.55, 0, 0.7, 0)
GetKeyButton.Text = "Get Key"
GetKeyButton.TextScaled = true
GetKeyButton.Font = Enum.Font.GothamSemibold
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
GetKeyButton.TextColor3 = Color3.new(1, 1, 1)
GetKeyButton.BorderSizePixel = 0
Instance.new("UICorner", GetKeyButton).CornerRadius = UDim.new(0, 8)

GetKeyButton.MouseButton1Click:Connect(function()
	setclipboard(LINKVERTISE_URL)
	Notify.Text = "Link copied to clipboard!"
	Notify.TextColor3 = Color3.fromRGB(80, 255, 80)
	Notify.Visible = true
	wait(2)
	Notify.Visible = false
end)

local function getValidKey()
	local success, result = pcall(function()
		return game:HttpGet(KEY_URL)
	end)
	if success then
		return result:match("^%s*(.-)%s*$")
	else
		Notify.Text = "Failed to fetch key!"
		Notify.TextColor3 = Color3.fromRGB(255, 80, 80)
		Notify.Visible = true
		notify(false, "Key fetch failed!")
		return nil
	end
end

CheckButton.MouseButton1Click:Connect(function()
	local realKey = getValidKey()
	local userInput = TextBox.Text:match("^%s*(.-)%s*$")

	if realKey and userInput == realKey then
		Notify.Text = "✅ Key Verified -- Loading..."
		Notify.TextColor3 = Color3.fromRGB(80, 255, 80)
		Notify.Visible = true
		writefile(KEY_FILE, userInput)
		notify(true, "Key saved & verified!")
		wait(2)

		TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
			Size = UDim2.new(0, 0, 0, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}):Play()

		wait(0.4)
		ScreenGui:Destroy()
		loadstring(game:HttpGet(SCRIPT_URL))()
	else
		Notify.Text = "Invalid Key!"
		Notify.TextColor3 = Color3.fromRGB(255, 80, 80)
		Notify.Visible = true
		notify(false, "Invalid key!")
	end
end)