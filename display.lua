--[[
		1: KZ-ʵ���ʱ��,KZ-����ʱ��
		2: KZ-ͨ�Ű�3.3V״̬
		3: KZ-ͨ�Ű��Դ�¶�,KZ-ͨ�Ű�FPGA�¶�,KZ-�����FPGA�¶�,KZ-������Դ�¶�,KZ-�洢��FPGA�¶�,KZ-�洢���Դ�¶�,KZ-��Դ���¶�1,KZ-��Դ���¶�2
		4: KZ-�����3.3V״̬
		5: KZ-�洢��3.3V״̬
		6: KZ-����45V��Դ
		7: KZ-����12V��Դ
		8: KZ-����-12V��Դ
		9: KZ-����PI1-COM��ѹ,KZ-����PI1-1��ѹ,KZ-����PI1-2��ѹ,KZ-����PI2-COM��ѹ,KZ-����PI2-1��ѹ,KZ-����PI2-2��ѹ
		10: KZ-����������LD����,KZ-�������ֱ�LD����
		11: KZ-������PPKTP�¶�,KZ-������PPKTP�¶�,KZ-����Դ������LD�¶�,KZ-����Դ���ֱ�LD�¶�,KZ-����ԴH����LD�¶�,KZ-����Դ+����LD�¶�
		12: KZ-������Դ״̬
		13: KZ-�洢���Դ״̬,KZ-����ԴH����LD����,KZ-����ԴPIN����
		14: KZ-�洢��ʹ������
		15: KZ-�洢������
		16: KZ-MT H�����Ӽ���,KZ-MT V�����Ӽ���,KZ-MT +�����Ӽ���,KZ-MT -�����Ӽ���,KZ-JF H�����Ӽ���,KZ-JF V�����Ӽ���,KZ-JF +�����Ӽ���,KZ-JF -�����Ӽ���
		16: KZ-MT JF H H���ϼ���,KZ-MT JF H V���ϼ���,KZ-MT JF H +���ϼ���,KZ-MT JF H -���ϼ���,KZ-MT JF V H���ϼ���,KZ-MT JF V V���ϼ���,KZ-MT JF V +���ϼ���,KZ-MT JF V -���ϼ���
		16: KZ-MT JF + H���ϼ���,KZ-MT JF + V���ϼ���,KZ-MT JF + +���ϼ���,KZ-MT JF + -���ϼ���,KZ-MT JF - H���ϼ���,KZ-MT JF - V���ϼ���,KZ-MT JF - +���ϼ���,KZ-MT JF - -���ϼ���

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
		--s = os.date("%Y��%m��%d��%Hʱ%M��%S��",tm)
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
	s = string.format("%d��%dʱ%d��%d��",day, hour, minits, seconds)
	return s
end

function Calc04(x)
	local cnt
	cnt = 0
	for i=1,4 do
		cnt = cnt * 256 + string.byte(x,5-i)
	end 

	local s
	s = string.format("%d",cnt)
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
	local y
	y = string.byte(x,1)
	y = 0.359*y
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc07(x)
	local y
	y = string.byte(x,1)
	y = 0.156*y
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc08(x)
	local y
	y = string.byte(x,1)
	y = 0.273*y
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc09(x)
	local y
	y = string.byte(x,1)
	y = 0.198*y
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc10(x)
	local y
	y = string.byte(x,1)
	y = 1.953*y
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc11(x)
	local y
	y = 0
	for i=1,2 do
			y = y * 256 + string.byte(x,i)
	end 
	y = -6.01188 - math.log(5100.0*y/(256.0*16.0-y))
	y = 21367836.2978 + 345686.8966*y
	y = -4622.53337 + math.sqrt(y)
	y = -172843.44828/y - 273
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc12(x)
	local y
	y = string.byte(x,1)
	y = 2.25*10.0/256.0*y
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc13(x)
	local y
	y = string.byte(x,1)
	y = 2*10.0/256.0*y
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc14(x)
	local y
	y = 0
	for i=1,3 do
			y = y * 256 + string.byte(x,i)
	end 
	y = (y+1)*16/1024/1024
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc15(x)
	local y
	y = 0
	for i=1,3 do
			y = y * 256 + string.byte(x,i)
	end 
	y = y*16/1024/1024
	local s
	s = string.format("%.2f",y)
	return s
end

function Calc16(x)
	local y
	y = 0
	for i=string.len(x), 1, -1 do
		y = y * 256 + string.byte(x,i)
	end
	local s
	s = string.format("%d",y)
	return s
end

function Calc17(x)
	local a, b, c, d
	a = string.byte(x, 1)
	b = string.byte(x, 2)
	c = string.byte(x, 3)
	d = string.byte(x, 4)
	s = string.format("%d.%d.%d.%d", a, b, c, d)
	return s
end