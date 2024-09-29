print("Plugin in lua läuft")

local function showtable(table)
  for keys, values in pairs(table) do
    print(keys, values)
  end
end
local Test = {"Yes", password="no","Balls"}
showtable(Test)


