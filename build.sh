#!/bin/bash

# Debug EC events (_QXX)
# 0: disabled
# 1: enabled
ECDEBUG=0

IASL='./tools/iasl -vw 3073 -vi -vr -p'
SRCACPI='src/ACPI'

rm -rf build && mkdir build

# Copy OpenCore EFI folder
cp -R download/oc/OpenCorePkg/X64/EFI build

OCFOLDER="build/EFI/OC"

# Build ACPI
$IASL $OCFOLDER/ACPI/SSDT-ALSD.aml $SRCACPI/SSDT-ALSD.dsl
$IASL $OCFOLDER/ACPI/SSDT-BATT.aml $SRCACPI/SSDT-BATT.dsl
$IASL $OCFOLDER/ACPI/SSDT-DMAC.aml $SRCACPI/SSDT-DMAC.dsl
$IASL $OCFOLDER/ACPI/SSDT-EC-USBX.aml $SRCACPI/SSDT-EC-USBX.dsl
$IASL $OCFOLDER/ACPI/SSDT-FN.aml $SRCACPI/SSDT-FN.dsl
$IASL $OCFOLDER/ACPI/SSDT-GPRW.aml $SRCACPI/SSDT-GPRW.dsl
$IASL $OCFOLDER/ACPI/SSDT-MEM2.aml $SRCACPI/SSDT-MEM2.dsl
$IASL $OCFOLDER/ACPI/SSDT-PLUG.aml $SRCACPI/SSDT-PLUG.dsl
$IASL $OCFOLDER/ACPI/SSDT-PMCR.aml $SRCACPI/SSDT-PMCR.dsl
$IASL $OCFOLDER/ACPI/SSDT-PNLF.aml $SRCACPI/SSDT-PNLF.dsl
$IASL $OCFOLDER/ACPI/SSDT-PPMC.aml $SRCACPI/SSDT-PPMC.dsl
$IASL $OCFOLDER/ACPI/SSDT-RMNE.aml $SRCACPI/SSDT-RMNE.dsl
$IASL $OCFOLDER/ACPI/SSDT-SBUS-MCHC.aml $SRCACPI/SSDT-SBUS-MCHC.dsl
$IASL $OCFOLDER/ACPI/SSDT-XOSI.aml $SRCACPI/SSDT-XOSI.dsl

# Copy UEFI Drivers
cp -R download/drivers/* $OCFOLDER/Drivers/

# Copy kexts
cp -R download/kexts/* $OCFOLDER/Kexts/
cp -R src/Kexts/* $OCFOLDER/Kexts/

# Copy OpenCore config
cp src/config.plist $OCFOLDER/config.plist

# Replace SMBIOS
if [ -e src/smbios.txt ]; then
    . src/smbios.txt
else
    . src/smbios-sample.txt
fi
sed -i "" -e "s/MLB_PLACEHOLDER/$MLB/" \
          -e "s/Serial_PLACEHOLDER/$SystemSerialNumber/" \
          -e "s/SmUUID_PLACEHOLDER/$SystemUUID/" $OCFOLDER/config.plist

# Remove unused UEFI Drivers
find $OCFOLDER/Drivers ! -name AudioDxe.efi \
                       ! -name HfsPlus.efi \
                       ! -name OpenRuntime.efi -type f -delete

# Remove unused UEFI Tools
rm -rf $OCFOLDER/Tools

# Build debug files if required
if [[ $ECDEBUG -eq 1 ]]; then
  $IASL build/ACPI/SSDT-RMDT.aml $SRCACPI/SSDT-RMDT.dsl
  $IASL build/ACPI/SSDT-EC-Debug.aml $SRCACPI/SSDT-EC-Debug.dsl
  ./tools/merge_plist.sh "ACPI:Add" src/config-debug.plist build/config.plist
  ./tools/merge_plist.sh "ACPI:Patch" src/config-debug.plist build/config.plist
  ./tools/merge_plist.sh "Kernel:Add" src/config-debug.plist build/config.plist
else
  rm -rf $OCFOLDER/Kexts/ACPIDebug.kext
fi
