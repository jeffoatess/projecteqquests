# items: 60173
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60173 =>1)) {
    if(!defined($qglobals{ikkylockout6})) {
      $InInstanceIkky7 = quest::GetInstanceID("ikkinz",6);
      if($InInstanceIkky7 == 0){
        quest::emote("motions for you to enter the altar through the entrance behind him.");
        $Instance = quest::CreateInstance("ikkinz", 6, 21600);
        $group = $client->GetGroup();
        if($group){
          quest::AssignGroupToInstance($Instance);	
        } else {
          quest::AssignToInstance($Instance);
        }
        quest::say("Instance added.");
      } else {
        $client->Message(13, "You are already in an instance!");
      }
    } else {
      $client->Message(13,"You have recently completed a raid.");
    }
    quest::summonitem(60173); # Item: Icon of the Altar
  }
  plugin::return_items(\%itemcount);
}
