DefinitionBlock ("", "SSDT", 2, "HIEP", "BATT", 0)
{
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.BDCH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BDCL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BDVH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BDVL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BFCH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BFCL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BPRH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BPRL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BPVH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BPVL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BRCH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BRCL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BSNH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BSNL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BST_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CMB0, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.CMB0.BATM, MutexObj)
    External (_SB_.PCI0.LPCB.H_EC.CMB0.BLFC, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.CMB0.BUFF, PkgObj)
    External (_SB_.PCI0.LPCB.H_EC.CMB0.FAKB, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.CMB0.PBIF, PkgObj)
    External (_SB_.PCI0.LPCB.H_EC.CMB0.PBIX, PkgObj)
    External (_SB_.PCI0.LPCB.H_EC.CYCH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CYCL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.MB16, IntObj)

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }

    Scope (_SB.PCI0.LPCB.H_EC)
    {
        OperationRegion (XCF4, EmbeddedControl, Zero, 0xFF)
        Field (XCF4, ByteAcc, Lock, Preserve)
        {
            Offset (0x84),
            BDC0, 8, BDC1, 8, // BDC
            BFC0, 8, BFC1, 8, // BFC
            BDV0, 8, BDV1, 8, // BDV
            Offset (0x92),
            BSN0, 8, BSN1, 8, // BSN
            BPR0, 8, BPR1, 8, // BPR
            BRC0, 8, BRC1, 8, // BRC
            BPV0, 8, BPV1, 8, // BPV
            Offset (0xD8),
            YC00, 8, YC01, 8, // CYC
        }

        Method (RE1B, 1, Serialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE, 8
            }

            Return (BYTE)
        }

        Method (RECB, 2, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                TEMP [Local0] = RE1B (Arg0)
                Arg0++
                Local0++
            }

            Return (TEMP)
        }

        Scope (CMB0)
        {
            Method (XBIF, 0, NotSerialized)
            {
                If (^^MB16)
                {
                    Local0 = B1B2 (BDC0, BDC1)
                }
                Else
                {
                    Local0 = ((^^BDCH << 0x08) + ^^BDCL)
                }

                If ((Local0 == 0xFFFF))
                {
                    ^PBIF [One] = 0xFFFFFFFF
                }
                Else
                {
                    ^PBIF [One] = (Local0 * 0x0A)
                }

                If (^^MB16)
                {
                    Local0 = B1B2 (BFC0, BFC1)
                }
                Else
                {
                    Local0 = ((^^BFCH << 0x08) + ^^BFCL)
                }

                If ((Local0 == 0xFFFF))
                {
                    ^BLFC = 0xFFFFFFFF
                    ^PBIF [0x02] = 0xFFFFFFFF
                }
                Else
                {
                    ^BLFC = Local0
                    ^PBIF [0x02] = (Local0 * 0x0A)
                }

                If (^^MB16)
                {
                    Local0 = B1B2 (BDV0, BDV1)
                }
                Else
                {
                    Local0 = ((^^BDVH << 0x08) + ^^BDVL)
                }

                If ((Local0 == 0xFFFF))
                {
                    Local0 = 0xFFFFFFFF
                }

                ^PBIF [0x04] = Local0
                ^PBIF [0x05] = (DerefOf (^PBIF [One]) / 0xC8)
                ^PBIF [0x06] = (DerefOf (^PBIF [One]) / 0x0190)
                If ((DerefOf (^PBIF [0x09]) == ""))
                {
                    ^PBIF [0x09] = ToString (RECB (0x9E, 0x48), Ones)
                }

                Acquire (^BATM, 0xFFFF)
                If (^^MB16)
                {
                    Local0 = B1B2 (BSN0, BSN1)
                }
                Else
                {
                    Local0 = ((^^BSNH << 0x08) + ^^BSNL)
                }

                Release (^BATM)
                Concatenate (ToDecimalString (Local0), "", ^PBIF [0x0A])
                Return (^PBIF)
            }

            Method (XBIX, 0, NotSerialized)
            {
                XBIF ()
                ^PBIX [One] = DerefOf (^PBIF [Zero])
                ^PBIX [0x02] = DerefOf (^PBIF [One])
                ^PBIX [0x03] = DerefOf (^PBIF [0x02])
                ^PBIX [0x04] = DerefOf (^PBIF [0x03])
                ^PBIX [0x05] = DerefOf (^PBIF [0x04])
                ^PBIX [0x06] = DerefOf (^PBIF [0x05])
                ^PBIX [0x07] = DerefOf (^PBIF [0x06])
                If (^^MB16)
                {
                    Local0 = B1B2 (YC00, YC01)
                }
                Else
                {
                    Local0 = ((^^CYCH << 0x08) + ^^CYCL)
                }

                ^PBIX [0x08] = Local0
                ^PBIX [0x0E] = DerefOf (^PBIF [0x05])
                ^PBIX [0x0F] = DerefOf (^PBIF [0x06])
                ^PBIX [0x10] = DerefOf (^PBIF [0x09])
                ^PBIX [0x11] = DerefOf (^PBIF [0x0A])
                Return (^PBIX)
            }

            Method (XBST, 0, NotSerialized)
            {
                ^BUFF [Zero] = ^^BST
                If (^^MB16)
                {
                    Local0 = B1B2 (BPR0, BPR1)
                }
                Else
                {
                    Local0 = ((^^BPRH << 0x08) + ^^BPRL)
                }

                If ((Local0 == 0x7FFF))
                {
                    Local0 = 0xFFFFFFFF
                    ^BUFF [One] = Local0
                }
                Else
                {
                    Local1 = Local0
                    If ((Local0 & 0x8000))
                    {
                        Local2 = (0x00010000 - Local1)
                    }
                    Else
                    {
                        Local2 = Local1
                    }

                    If (^^MB16)
                    {
                        Local3 = B1B2 (BPV0, BPV1)
                    }
                    Else
                    {
                        Local3 = ((^^BPVH << 0x08) + ^^BPVL)
                    }

                    Divide ((Local2 * Local3), 0x03E8, Local4, Local0)
                    ^BUFF [One] = Local0
                }

                Acquire (^BATM, 0xFFFF)
                If (^^MB16)
                {
                    Local0 = B1B2 (BRC0, BRC1)
                }
                Else
                {
                    Local0 = ((^^BRCH << 0x08) + ^^BRCL)
                }

                Release (^BATM)
                If ((Local0 == 0xFFFF))
                {
                    Local0 = 0xFFFFFFFF
                }

                Acquire (^BATM, 0xFFFF)
                If (^^MB16)
                {
                    Local1 = B1B2 (BFC0, BFC1)
                }
                Else
                {
                    Local1 = ((^^BFCH << 0x08) + ^^BFCL)
                }

                Release (^BATM)
                If ((Local1 == 0xFFFF))
                {
                    Local1 = 0xFFFFFFFF
                }

                Local2 = ^BLFC
                Divide ((Local0 * Local2), Local1, Local4, Local3)
                If (((Local4 << One) >= Local1))
                {
                    Local3 += One
                }

                Local0 = Local3
                If ((Local0 > ^BLFC))
                {
                    ^BUFF [0x02] = (^BLFC * 0x0A)
                }
                Else
                {
                    ^BUFF [0x02] = (Local0 * 0x0A)
                }

                If (^FAKB)
                {
                    Local0 = DerefOf (^BUFF [0x02])
                    Local0 -= (^FAKB * 0x01F4)
                    ^BUFF [0x02] = Local0
                }

                Acquire (^BATM, 0xFFFF)
                If (^^MB16)
                {
                    Local0 = B1B2 (BPV0, BPV1)
                }
                Else
                {
                    Local0 = ((^^BPVH << 0x08) + ^^BPVL)
                }

                Release (^BATM)
                If ((Local0 == 0xFFFF))
                {
                    Local0 = 0xFFFFFFFF
                }

                ^BUFF [0x03] = Local0
                Return (^BUFF)
            }
        }
    }
}

