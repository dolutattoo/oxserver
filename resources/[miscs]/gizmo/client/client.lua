local gizmo = nil

SetEntityDrawOutlineShader(2)

local options = {
	{
		name = 'ox:option1',
		event = 'ox_target:debug',
		icon = 'fa-brands fa-unity',
		label = 'Toggle Gizmo',
		onSelect = function(data)
			gizmo = not gizmo
			if gizmo then
				exports.gizmo:Toggle(data.entity)

				SetEntityDrawOutlineShader(2)
				SetEntityDrawOutline(data.entity, true)
				for i = 1, 150, 10 do
					SetEntityDrawOutlineColor(0, 0, 10, i)
					Wait(0)
				end
			else
				for i = 150, 0, -15 do
					SetEntityDrawOutlineColor(0, 0, 10, i)
					Wait(0)
				end

				exports.gizmo:Toggle(data.entity)
				SetEntityDrawOutline(data.entity, false)

				Wait(0)
				SetEntityDrawOutlineShader(0)
			end
		end,
		drawSprite = true,
		distance = 20,
	},
}
exports.ox_target:addGlobalObject(options)
exports.ox_target:addGlobalVehicle(options)
exports.ox_target:addGlobalPed({
	{
		name = 'ox:option1',
		event = 'ox_target:debug',
		icon = 'fa-brands fa-unity',
		label = 'Toggle Gizmo',
		onSelect = function(data)
			exports.gizmo:Toggle(data.entity)
			gizmo = not gizmo
		end,
		drawSprite = true,
		distance = 20,
	},
})
