_attackPos = _this select 0;
_randomNumb = floor(random 101);

if(false) exitWith {};

if(true) then {
	_spawnPos = [_attackPos, 225] call CBA_fnc_randPos;
	_attackSquad = [_spawnPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Patrol_section")] call BIS_fnc_spawnGroup;
	[_attackSquad, _attackPos, 20] call CBA_fnc_taskAttack;
};