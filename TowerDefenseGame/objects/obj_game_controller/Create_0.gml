/// @description Insert description here
// You can write your code in this editor
enemy_amount  = 5;
spawned_counter = 0;
spawn_rate = 1 * room_speed;
alarm[0] = 1;
alarm[1] = room_speed * 5;

global.hp = 100;
global.spd = 1;
global.level = 1;
global.player_hp = 100;

global.gold = 150;

function generateEnemies()
{
	if(spawned_counter < enemy_amount)
	{
		if(global.level > 5)
		{
			if(spawned_counter < enemy_amount / 2)
			{
				var enemy = choose(obj_enemy_fast, obj_enemy);
				instance_create_depth(x,y,-1, enemy);
			}
			else{instance_create_depth(x,y,-1,obj_enemy);}
		}
		else if(global.level > 10)
		{
			var enemy = choose(obj_enemy_fast, obj_enemy);
			instance_create_depth(x,y,-1, enemy);
		}
		else if (global.level > 15)
		{
			if(spawned_counter < enemy_amount / 2)
			{
				var enemy = choose(obj_enemy_fast, obj_enemy);
				instance_create_depth(x,y,-1, enemy);
			}
			else
			{
				var enemy = choose(obj_enemy_fast, obj_enemy, obj_enemy_fat);
				instance_create_depth(x,y,-1, enemy);
			}
		}
		else if (global.level > 20)
		{
				var enemy = choose(obj_enemy_fast, obj_enemy, obj_enemy_fat);
				instance_create_depth(x,y,-1, enemy);
		}
		else if (global.level == 25)
		{
			if(spawned_counter  == enemy_amount - 1)
			{
				instance_create_depth(x, y, -1, obj_enemy_boss);
			}
			else
			{
				var enemy = choose(obj_enemy_fast, obj_enemy, obj_enemy_fat);
				instance_create_depth(x,y,-1, enemy);
			}
		}
		else 
		{
			instance_create_depth(x,y,-1,obj_enemy);
		}
		spawned_counter++;
		alarm[0] = spawn_rate;
	} 
}

