Config = {
    Key = 38, ---- E
    QTarget = false ---- Enable this if ur using Qtarget
}




Config.Zones = {
    Police = {
       Job = "police",
       OffDuty = "off-duty", --- Database name for off-duty
       Pos = vector3(439.26, -981.67, 30.67),
       DrawDistance = 2.5,
    },
    Ambulance = {
        Job = "ambulance",
        OffDuty = "off-duty", --- Database name for off-duty
        Pos = vector3(297.40, -581.72, 43.0), -- change this to your hospital
        DrawDistance = 2.5,
    }
}



Config.Trans = {
    Press = "Press [E] to Open The Duty Menu",
    OnDuty = "Welcome Back",
    OffDuty = "You went Off-Duty",
    AlreadyOffDuty = "Your Already Off-Duty",
    AlreadyOnDuty = "You are already On-Duty",
}


