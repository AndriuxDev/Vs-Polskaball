--created with Super_Hugo's Stage Editor v1.6.3

function onCreate()

	makeLuaSprite('obj1', 'pause/endGrad', 0, 0)
	setObjectCamera('obj1', 'camOther')
	setObjectOrder('obj1', -1)
	setProperty('obj1.alpha', 0)
	addLuaSprite('obj1', true)
	
	makeLuaSprite('obj2', 'stage/sky', -2182, -1614)
	setObjectOrder('obj2', 0)
	scaleObject('obj2', 1.8, 1.8)
	addLuaSprite('obj2', true)
	
	makeLuaSprite('obj3', 'stage/rocket', -1391, -14)
	setObjectOrder('obj3', 1)
	scaleObject('obj3', 1.3, 1.3)
	setProperty('obj3.angle', 355)
	addLuaSprite('obj3', true)
	
	makeLuaSprite('obj4', 'stage/hills', -2261, 26)
	setObjectOrder('obj4', 2)
	scaleObject('obj4', 2, 2)
	addLuaSprite('obj4', true)
	
	makeLuaSprite('obj7', 'stage/moon', 518, -1362)
	setObjectOrder('obj7', 2)
	scaleObject('obj7', 1.6, 1.6)
	setScrollFactor('obj7', 0.6, 0.6)
	addLuaSprite('obj7', true)
	
end