#define GOV_TLED        0x2020008
#define WM_GET          1
#define WM_SET          2
#define WM_KEY_LIGHT        0x400
#define WM_TLED             0x404
#define WM_FN_LOCK          0x407
#define WM_BATT_LIMIT       0x61
#define WM_READER_MODE      0xBF
#define WM_FAN_MODE	        0x33
#define WMBB_USB_CHARGE     0x10B
#define WMBB_BATT_LIMIT     0x10C

#define KEY_FNF1            0x70
#define KEY_FNF5            0x74

#define KEY_F14             0x0405
#define KEY_F15             0x0406
#define KEY_F16             0x0367
#define KEY_F17             0x0368
#define KEY_F18             0x0369
#define KEY_F19             0x036A
#define KEY_F20             0x036B

#define KEY_LSHIFT_DOWN     0x012a
#define KEY_LSHIFT_UP       0x01aa
#define KEY_RSHIFT_DOWN     0x0136
#define KEY_RSHIFT_UP       0x01b6

DefinitionBlock ("", "SSDT", 2, "HIEP", "FN", 0)
{
    External (LGEC, IntObj)
    External (XINI.WMAB, MethodObj)
    External (_SB_.GGOV, MethodObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.RDMD, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FNKN, FieldUnitObj)

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Method (_Q51, 0, NotSerialized) // Fn + F2
        {
            If (LGEC)
            {
                Notify (\_SB.PCI0.LPCB.PS2K, KEY_F14)
            }
        }

        Method (_Q50, 0, NotSerialized) // Fn + F3
        {
            If (LGEC)
            {
                Notify (\_SB.PCI0.LPCB.PS2K, KEY_F15)
            }
        }

        Method (_Q34, 0, NotSerialized) // Fn + F4
        {
            If (LGEC)
            {
                Notify (\_SB.PCI0.LPCB.PS2K, KEY_F20)
            }
        }

        Method (_Q36, 0, NotSerialized) // Fn + F6
        {
            If (LGEC)
            {
                Notify(\_SB.PCI0.LPCB.PS2K, KEY_F19)
            }
        }

        Method (_Q37, 0, NotSerialized) // Fn + F7
        {
            If (LGEC)
            {
                Notify(\_SB.PCI0.LPCB.PS2K, KEY_F16)
            }
        }

        Method (_Q30, 0, NotSerialized) // Fn + F8
        {
            If (LGEC)
            {
                Local0 = \XINI.WMAB(WM_KEY_LIGHT, WM_GET, 0)
                CreateDWordField (Local0, Zero, RVAL)
                Local1 = RVAL & 0xf
                If (Local1 == 4)
                {
                    // Backlight Bright
                    // Send Left Shift + F19
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_LSHIFT_DOWN)
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_F19)
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_LSHIFT_UP)
                }
                ElseIf (Local1 == 2)
                {
                    // Backlight Dimmed
                    // Send Right Shift + F16
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_RSHIFT_DOWN)
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_F16)
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_RSHIFT_UP)
                }
                Else
                {
                    // Backlight Off
                    // Send Left Shift + F16
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_LSHIFT_DOWN)
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_F16)
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_LSHIFT_UP)
                }
            }
        }

        Method (_Q72, 0, NotSerialized) // Fn + F9
        {
            If (LGEC)
            {
                Local0 = \_SB.PCI0.LPCB.H_EC.RDMD
                \_SB.PCI0.LPCB.H_EC.RDMD = !Local0
                Notify(\_SB.PCI0.LPCB.PS2K, KEY_F18)
            }
        }

        Method (_QFF, 0, NotSerialized) // Fn + F1 or Fn + F5
        {
            If (LGEC)
            {
                Local0 = \_SB.PCI0.LPCB.H_EC.FNKN
                If (Local0 == KEY_FNF5)
                {
                    Local1 = \_SB.GGOV(GOV_TLED)
                    \XINI.WMAB(WM_TLED, WM_SET, !Local1)
                    Notify(\_SB.PCI0.LPCB.PS2K, 0x041e) // e01e
                }
                ElseIf (Local0 == KEY_FNF1)
                {
                    Notify(\_SB.PCI0.LPCB.PS2K, KEY_F17)
                }
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.PS2K)
    {
        Name (RMCF, Package()
        {
            "Keyboard", Package()
            {
                "Custom PS2 Map", Package()
                {
                    Package(){},
                    "e01e=e037",
                    "e037=64", // PrtSc -> F13
                    "46=e01f", // FN + PrtSc (ScrLk) -> Dead key
                },
            },
        })
    }
}
