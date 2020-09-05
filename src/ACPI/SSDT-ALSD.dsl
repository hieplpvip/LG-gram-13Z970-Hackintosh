DefinitionBlock ("", "SSDT", 2, "HIEP", "ALSD", 0)
{
    External (ALSE, IntObj)

    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            ALSE = 2
        }
    }
}
