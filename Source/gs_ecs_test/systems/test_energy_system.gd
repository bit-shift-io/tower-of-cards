extends System
class_name TestEnergySystem


func on_process(entities, delta):
	for _entity in entities:
		var _energy = _entity.get_component("energy")
		_energy.energy -= 1
		if _energy.energy < 0:
			_energy.energy = _energy.energy_max
