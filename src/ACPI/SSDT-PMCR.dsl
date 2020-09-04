DefinitionBlock ("", "SSDT", 2, "HIEP", "PMCR", 0)
{
    External(_SB.PCI0.LPCB, DeviceObj)
    Scope (_SB.PCI0.LPCB)
    {
        Device (PMCR)
        {
            Name (_HID, EisaId ("APP9876"))
            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0xFE000000, 0x00010000)
            })
        }
    }
}
