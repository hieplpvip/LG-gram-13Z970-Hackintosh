#define KEY_F14         0x0405
#define KEY_F15         0x0406
#define KEY_F16         0x0367
#define KEY_F17         0x0368
#define KEY_F18         0x0369
#define KEY_F19         0x036A

DefinitionBlock ("", "SSDT", 2, "HIEP", "FN", 0)
{
    External (LGEC, IntObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB.PCI0.LPCB.H_EC.RDMD, FieldUnitObj)

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Method (_Q50, 0, NotSerialized)
        {
            If (LGEC)
            {
                Notify (\_SB.PCI0.LPCB.PS2K, KEY_F15)
            }
        }

        Method (_Q51, 0, NotSerialized)
        {
            If (LGEC)
            {
                Notify (\_SB.PCI0.LPCB.PS2K, KEY_F14)
            }
        }

        Method (_Q36, 0, NotSerialized) //FN + F6
        {
            If (LGEC)
            {
                Notify(\_SB.PCI0.LPCB.PS2K, KEY_F19)
            }
        }

        Method (_Q37, 0, NotSerialized) //FN + F7
        {
            If (LGEC)
            {
                Notify(\_SB.PCI0.LPCB.PS2K, KEY_F16)
            }
        }

        Method (_Q72, 0, NotSerialized) //FN + F9
        {
            If (LGEC)
            {
                Local0 = \_SB.PCI0.LPCB.H_EC.RDMD
                \_SB.PCI0.LPCB.H_EC.RDMD = !Local0
                Notify(\_SB.PCI0.LPCB.PS2K, KEY_F18)
            }
        }
    }
}
