-- #Jerimo_Jiao (291113)

function event_say(e)
    --Uqua request
    local group = e.other:GetGroup();
    local HasLockout = 0;
    if(e.message:findi("hail")) then
        e.self:Say("Beware traveler for behind me lies the way to an ancient temple long since forgotten about. It is within this temple that the trusik have begun a ritual similar to the one that brought the menacing beings known as Muramites. While it may appear to be nothing what you see behind me is a complex illusion placed here by those inside to trick travelers like you. But after losing my life and that of the one I loved to the invading army I am bound here to help those who wish to stop the trusik from damning us again. If you are truly a brave adventurer then just tell me you are [" .. eq.say_link("ready",false,"ready") .. "] and I will tell you how to get through the facade behind me.");
    elseif(e.message:findi("ready")) then
        local instance_id = eq.get_instance_id("uqua",0);
        -- should never be nil, but just in case.
        if (instance_id == nil or instance_id == 0) then
            -- the instance is only good for 6 hours (21600 seconds).
            instance_id = eq.create_instance("uqua",0,21600);
            if (group.valid) then
                eq.assign_group_to_instance(instance_id);
            else
                eq.assign_to_instance(instance_id);
            end
            e.self:Say("Place your hands on one of the altars behind me and the way will be revealed. Be wary for you are about to encounter some of the most vicious trusik known. If for any reason you wish to return, place your hands on the golem within the temple.");
        else
            e.other:Message(13, "You are already in an instance.");
        end
    end
end
