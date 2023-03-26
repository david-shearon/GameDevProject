//doing sprint cooldowns this way so that you can use your sprint in short bursts
//and not go onto cooldown but if you hold it you have to wait for your stamina to regen
function sprint_logic(){
	//player is on sprint cooldown if your stamina is <= 0
	if(stamina <= 0) {
	sprintCD = true;
	}
	
	//while on sprint cooldown and sprint time isn't full then slowly regen sprint time
	if(sprintCD == true && stamina < MAX_SPRINT_TIME) {
		stamina += 0.2	
	}
	
	//if you don't waste all your stamina then you can regen your stamina back faster
	if(sprintCD == false && stamina < MAX_SPRINT_TIME) {
		stamina += 1	
	}
	
	//once sprint time is full the player can sprint again
	if(stamina == MAX_SPRINT_TIME) {
		sprintCD = false;	
	}
}