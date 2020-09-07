#!/bin/bash

IASL='./tools/iasl -vw 3073 -vi -vr -p'
SRCACPI='src/ACPI'

rm -rf build && mkdir build

# Build ACPI
mkdir build/ACPI
$IASL build/ACPI/SSDT-ALSD.aml $SRCACPI/SSDT-ALSD.dsl
$IASL build/ACPI/SSDT-BATT.aml $SRCACPI/SSDT-BATT.dsl
$IASL build/ACPI/SSDT-DMAC.aml $SRCACPI/SSDT-DMAC.dsl
$IASL build/ACPI/SSDT-EC-USBX.aml $SRCACPI/SSDT-EC-USBX.dsl
$IASL build/ACPI/SSDT-FN.aml $SRCACPI/SSDT-FN.dsl
$IASL build/ACPI/SSDT-GPRW.aml $SRCACPI/SSDT-GPRW.dsl
$IASL build/ACPI/SSDT-MEM2.aml $SRCACPI/SSDT-MEM2.dsl
$IASL build/ACPI/SSDT-PLUG.aml $SRCACPI/SSDT-PLUG.dsl
$IASL build/ACPI/SSDT-PMCR.aml $SRCACPI/SSDT-PMCR.dsl
$IASL build/ACPI/SSDT-PNLF.aml $SRCACPI/SSDT-PNLF.dsl
$IASL build/ACPI/SSDT-PPMC.aml $SRCACPI/SSDT-PPMC.dsl
$IASL build/ACPI/SSDT-RMNE.aml $SRCACPI/SSDT-RMNE.dsl
$IASL build/ACPI/SSDT-SBUS-MCHC.aml $SRCACPI/SSDT-SBUS-MCHC.dsl
$IASL build/ACPI/SSDT-XOSI.aml $SRCACPI/SSDT-XOSI.dsl

# Copy UEFI Drivers
cp -R src/Drivers build/Drivers

# Copy kexts
cp -R download/kexts build/Kexts
cp -R src/Kexts/* build/Kexts/

# Copy OpenCore config
cp src/config.plist build/config.plist

# Replace SMBIOS
. src/smbios.txt
sed -i "" -e "s/MLB_PLACEHOLDER/$MLB/" \
          -e "s/Serial_PLACEHOLDER/$SystemSerialNumber/" \
          -e "s/SmUUID_PLACEHOLDER/$SystemUUID/" build/config.plist
