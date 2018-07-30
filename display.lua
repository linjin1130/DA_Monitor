--[[
		1: KZ-实验机时间,KZ-星务时间
		2: KZ-通信板3.3V状态
		3: KZ-通信板电源温度,KZ-通信板FPGA温度,KZ-试验板FPGA温度,KZ-试验板电源温度,KZ-存储板FPGA温度,KZ-存储板电源温度,KZ-电源板温度1,KZ-电源板温度2
		4: KZ-试验板3.3V状态
		5: KZ-存储板3.3V状态
		6: KZ-纠缠45V电源
		7: KZ-纠缠12V电源
		8: KZ-纠缠-12V电源
		9: KZ-纠缠PI1-COM电压,KZ-纠缠PI1-1电压,KZ-纠缠PI1-2电压,KZ-纠缠PI2-COM电压,KZ-纠缠PI2-1电压,KZ-纠缠PI2-2电压
		10: KZ-纠缠泵浦主LD电流,KZ-纠缠泵浦备LD电流
		11: KZ-纠缠主PPKTP温度,KZ-纠缠备PPKTP温度,KZ-纠缠源泵浦主LD温度,KZ-纠缠源泵浦备LD温度,KZ-纠缠源H极化LD温度,KZ-纠缠源+极化LD温度
		12: KZ-试验板电源状态
		13: KZ-存储板电源状态,KZ-纠缠源H极化LD电流,KZ-纠缠源PIN功率
		14: KZ-存储已使用容量
		15: KZ-存储总容量
		16: KZ-MT H单光子计数,KZ-MT V单光子计数,KZ-MT +单光子计数,KZ-MT -单光子计数,KZ-JF H单光子计数,KZ-JF V单光子计数,KZ-JF +单光子计数,KZ-JF -单光子计数
		16: KZ-MT JF H H符合计数,KZ-MT JF H V符合计数,KZ-MT JF H +符合计数,KZ-MT JF H -符合计数,KZ-MT JF V H符合计数,KZ-MT JF V V符合计数,KZ-MT JF V +符合计数,KZ-MT JF V -符合计数
		16: KZ-MT JF + H符合计数,KZ-MT JF + V符合计数,KZ-MT JF + +符合计数,KZ-MT JF + -符合计数,KZ-MT JF - H符合计数,KZ-MT JF - V符合计数,KZ-MT JF - +符合计数,KZ-MT JF - -符合计数

]]--

function Calc01(x)
		local second
		second = 0
		for i=1,4 do
			second = second * 256 + string.byte(x,i)
		end 
		
		t = {year=2012, month=1, day=1, hour=0}

		--local tm
		local getTime = os.date("%c");
		--tm = os.time(getTime)
		--tm = tm + 0
		
		--local s
		--s = os.date("%Y年%m月%d日%H时%M分%S秒",tm)
		return getTime
end

function Calc02(x)
	local y
	y = 0
	for i=1,2 do
		y = y * 256 + string.byte(x,i)
	end 
	
	y = 30+7.3*(y-39200)/1000.0
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc03(x)
	local second
	second = 0
	for i=1,4 do
		second = second * 256 + string.byte(x,i)
	end 
	
	day = math.floor(second / (24*3600))
	hour = math.floor(second%(24*3600)/3600)
	minits =  math.floor((second % 3600)/60)
	seconds = second % 60
	
	local s
	s = string.format("%d-%d:%d:%d",day, hour, minits, seconds)
	return s
end

function Calc04(x)
	local cnt
	cnt = 0
	for i=1,4 do
		cnt = cnt * 256 + string.byte(x,5-i)
	end 

	local s
	s = string.format("%u",cnt)
	return s
end

function Calc05(x)
	local cnt
	cnt = 0
	for i=1,2 do
		cnt = cnt * 256 + string.byte(x,3-i)
	end 

	local s
	s = string.format("%d",cnt)
	return s
end

function Calc06(x)
	local hw_version
	local sw_version
	local big_version

	big_version = string.byte(x,3)
	hw_version = string.byte(x,2)
	sw_version = string.byte(x,1)
	local s
	s = string.format("%02d-%03d-%03d",big_version, hw_version, sw_version)
	return s
end

function Calc07(x)
	local s
	s = string.format("%d.%d.%d.%d",string.byte(x,1),string.byte(x,2),string.byte(x,3),string.byte(x,4))
	return s
end

function Calc08(x)
	local H_ver, S_ver
	H_ver = string.byte(x,1)
	S_ver = string.byte(x,2)
	local s
	s = string.format("%d-%d", H_ver, S_ver)
	return s
end

function Calc09(x)
	local Ser, num, S
	Ser = string.byte(x,2)
	num = string.byte(x,1)
	
	if Ser == 2 then
	  S = "C"
	elseif Ser == 3 then
	  S = "D"
	elseif Ser == 4 then
	  S = "E"
	elseif Ser == 5 then
	  S = "F"
	elseif Ser == 6 then
	  S = "G"
	elseif Ser == 7 then
	  S = "H"
	elseif Ser == 8 then
	  S = "I"
	elseif Ser == 9 then
	  S = "J"
	elseif Ser == 10 then
	  S = "K"
	elseif Ser == 11 then
	  S = "L"
	elseif Ser == 12 then
	  S = "M"
	elseif Ser == 13 then
	  S = "N"
	elseif Ser == 14 then
	  S = "O"
	else
	  S = "A/B"
	end
	local str
	str = string.format("%s-%02d", S, num)
	return str
end

function Calc10(x)
	local cnt
	cnt = 0
	for i=1,4 do
		cnt = cnt * 256 + string.byte(x,5-i) * 65536
	end 

	local s
	s = string.format("%u",cnt)
	return s
end


function Calc11(x)
	local num, S
	num = string.byte(x,1)
	if num == 0 then
	  S = "GOLDEN区"
	elseif num == 3 then
	  S = "UPDATE区"
	else
	  S = "未知区域"
	end
	return S
end
-- function Calc09(x)
	-- local y
	-- y = string.byte(x,1)
	-- y = 0.198*y
	-- local s
	-- s = string.format("%.2f",y)
	-- return s
-- end

-- function Calc10(x)
	-- local y
	-- y = string.byte(x,1)
	-- y = 1.953*y
	-- local s
	-- s = string.format("%.2f",y)
	-- return s
-- end

-- function Calc11(x)
	-- local y
	-- y = 0
	-- for i=1,2 do
			-- y = y * 256 + string.byte(x,i)
	-- end 
	-- y = -6.01188 - math.log(5100.0*y/(256.0*16.0-y))
	-- y = 21367836.2978 + 345686.8966*y
	-- y = -4622.53337 + math.sqrt(y)
	-- y = -172843.44828/y - 273
	-- local s
	-- s = string.format("%.2f",y)
	-- return s
-- end

-- function Calc12(x)
	-- local y
	-- y = string.byte(x,1)
	-- y = 2.25*10.0/256.0*y
	-- local s
	-- s = string.format("%.2f",y)
	-- return s
-- end

-- function Calc13(x)
	-- local y
	-- y = string.byte(x,1)
	-- y = 2*10.0/256.0*y
	-- local s
	-- s = string.format("%.2f",y)
	-- return s
-- end

-- function Calc14(x)
	-- local y
	-- y = 0
	-- for i=1,3 do
			-- y = y * 256 + string.byte(x,i)
	-- end 
	-- y = (y+1)*16/1024/1024
	-- local s
	-- s = string.format("%.2f",y)
	-- return s
-- end

-- function Calc15(x)
	-- local y
	-- y = 0
	-- for i=1,3 do
			-- y = y * 256 + string.byte(x,i)
	-- end 
	-- y = y*16/1024/1024
	-- local s
	-- s = string.format("%.2f",y)
	-- return s
-- end

-- function Calc16(x)
	-- local y
	-- y = 0
	-- for i=string.len(x), 1, -1 do
		-- y = y * 256 + string.byte(x,i)
	-- end
	-- local s
	-- s = string.format("%d",y)
	-- return s
-- end

-- function Calc17(x)
	-- local a, b, c, d
	-- a = string.byte(x, 1)
	-- b = string.byte(x, 2)
	-- c = string.byte(x, 3)
	-- d = string.byte(x, 4)
	-- s = string.format("%d.%d.%d.%d", a, b, c, d)
	-- return s
-- end
