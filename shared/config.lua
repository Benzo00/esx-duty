Config = {
    Job = "police", --- Database name for police
    OffDuty = "off-duty", --- Database name for off-duty
    Key = 38, ---- E
    QTarget = false ---- Enable this if ur using Qtarget
}

Config.Utils = {
    Marker = vector3(439.26, -981.67, 30.67),
    DrawDistance = 2.5,
}

Config.Webhook = {
    Webhook = "",
    Title = "Duty System",
    Color = 0191102, --- Green 
    Date = '%x %X %p' 
}

Config.Trans = {
    Press = "Press ~INPUT_CONTEXT~ to Open The Duty Menu",
    OnDuty = "Welcome Back",
    OffDuty = "You went Off-Duty",
    AlreadyOffDuty = "You're Already Off-Duty",
    AlreadyOnDuty = "You're Already On-Duty",
}
