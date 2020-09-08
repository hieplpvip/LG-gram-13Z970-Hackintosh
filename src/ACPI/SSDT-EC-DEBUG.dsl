DefinitionBlock ("", "SSDT", 2, "HIEP", "ECDEBUG", 0)
{
    External (_SB.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB.PCI0.LPCB.H_EC.XQFF, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ01, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ02, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ03, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ04, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ05, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ06, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ20, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ30, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ7B, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ7C, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ34, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ36, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ37, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ80, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ3B, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ3D, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ40, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ42, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ45, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ47, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ50, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ51, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ52, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ53, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ63, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ64, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ67, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ69, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ6A, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ6B, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ6C, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ6F, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ72, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ73, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ76, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ79, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ7A, MethodObj)
    External (RMDT.P1, MethodObj)

    Scope (_SB.PCI0.LPCB.H_EC)
    {
        //Method (_QFF, 0, NotSerialized)
        //{
        //    \RMDT.P1 ("EC-DEBUG: _QFF is called")
        //    \_SB.PCI0.LPCB.H_EC.XQFF()
        //}
        Method (_Q01, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q01 is called")
            \_SB.PCI0.LPCB.H_EC.XQ01()
        }
        Method (_Q02, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q02 is called")
            \_SB.PCI0.LPCB.H_EC.XQ02()
        }
        Method (_Q03, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q03 is called")
            \_SB.PCI0.LPCB.H_EC.XQ03()
        }
        Method (_Q04, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q04 is called")
            \_SB.PCI0.LPCB.H_EC.XQ04()
        }
        Method (_Q05, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q05 is called")
            \_SB.PCI0.LPCB.H_EC.XQ05()
        }
        Method (_Q06, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q06 is called")
            \_SB.PCI0.LPCB.H_EC.XQ06()
        }
        Method (_Q20, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q20 is called")
            \_SB.PCI0.LPCB.H_EC.XQ20()
        }
        //Method (_Q30, 0, NotSerialized)
        //{
        //    \RMDT.P1 ("EC-DEBUG: _Q30 is called")
        //    \_SB.PCI0.LPCB.H_EC.XQ30()
        //}
        Method (_Q7B, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q7B is called")
            \_SB.PCI0.LPCB.H_EC.XQ7B()
        }
        Method (_Q7C, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q7C is called")
            \_SB.PCI0.LPCB.H_EC.XQ7C()
        }
        //Method (_Q34, 0, NotSerialized)
        //{
        //    \RMDT.P1 ("EC-DEBUG: _Q34 is called")
        //    \_SB.PCI0.LPCB.H_EC.XQ34()
        //}
        //Method (_Q36, 0, NotSerialized)
        //{
        //    \RMDT.P1 ("EC-DEBUG: _Q36 is called")
        //    \_SB.PCI0.LPCB.H_EC.XQ36()
        //}
        //Method (_Q37, 0, NotSerialized)
        //{
        //    \RMDT.P1 ("EC-DEBUG: _Q37 is called")
        //    \_SB.PCI0.LPCB.H_EC.XQ37()
        //}
        Method (_Q80, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q80 is called")
            \_SB.PCI0.LPCB.H_EC.XQ80()
        }
        Method (_Q3B, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q3B is called")
            \_SB.PCI0.LPCB.H_EC.XQ3B()
        }
        Method (_Q3D, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q3D is called")
            \_SB.PCI0.LPCB.H_EC.XQ3D()
        }
        Method (_Q40, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q40 is called")
            \_SB.PCI0.LPCB.H_EC.XQ40()
        }
        Method (_Q42, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q42 is called")
            \_SB.PCI0.LPCB.H_EC.XQ42()
        }
        Method (_Q45, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q45 is called")
            \_SB.PCI0.LPCB.H_EC.XQ45()
        }
        Method (_Q47, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q47 is called")
            \_SB.PCI0.LPCB.H_EC.XQ47()
        }
        //Method (_Q50, 0, NotSerialized)
        //{
        //    \RMDT.P1 ("EC-DEBUG: _Q50 is called")
        //    \_SB.PCI0.LPCB.H_EC.XQ50()
        //}
        //Method (_Q51, 0, NotSerialized)
        //{
        //    \RMDT.P1 ("EC-DEBUG: _Q51 is called")
        //    \_SB.PCI0.LPCB.H_EC.XQ51()
        //}
        Method (_Q52, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q52 is called")
            \_SB.PCI0.LPCB.H_EC.XQ52()
        }
        Method (_Q53, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q53 is called")
            \_SB.PCI0.LPCB.H_EC.XQ53()
        }
        Method (_Q63, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q63 is called")
            \_SB.PCI0.LPCB.H_EC.XQ63()
        }
        Method (_Q64, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q64 is called")
            \_SB.PCI0.LPCB.H_EC.XQ64()
        }
        Method (_Q67, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q67 is called")
            \_SB.PCI0.LPCB.H_EC.XQ67()
        }
        Method (_Q69, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q69 is called")
            \_SB.PCI0.LPCB.H_EC.XQ69()
        }
        Method (_Q6A, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q6A is called")
            \_SB.PCI0.LPCB.H_EC.XQ6A()
        }
        Method (_Q6B, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q6B is called")
            \_SB.PCI0.LPCB.H_EC.XQ6B()
        }
        Method (_Q6C, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q6C is called")
            \_SB.PCI0.LPCB.H_EC.XQ6C()
        }
        Method (_Q6F, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q6F is called")
            \_SB.PCI0.LPCB.H_EC.XQ6F()
        }
        //Method (_Q72, 0, NotSerialized)
        //{
        //    \RMDT.P1 ("EC-DEBUG: _Q72 is called")
        //    \_SB.PCI0.LPCB.H_EC.XQ72()
        //}
        Method (_Q73, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q73 is called")
            \_SB.PCI0.LPCB.H_EC.XQ73()
        }
        Method (_Q76, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q76 is called")
            \_SB.PCI0.LPCB.H_EC.XQ76()
        }
        Method (_Q79, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q79 is called")
            \_SB.PCI0.LPCB.H_EC.XQ79()
        }
        Method (_Q7A, 0, NotSerialized)
        {
            \RMDT.P1 ("EC-DEBUG: _Q7A is called")
            \_SB.PCI0.LPCB.H_EC.XQ7A()
        }
    }
}
