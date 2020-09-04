#!/bin/bash

IASL='./tools/iasl -vw 3073 -vi -vr -p'
SRCACPI='src/ACPI'

rm -rf build && mkdir build

# Build ACPI
mkdir build/ACPI
$IASL build/ACPI/SSDT-DMAC.aml $SRCACPI/SSDT-DMAC.dsl
$IASL build/ACPI/SSDT-EC-USBX.aml $SRCACPI/SSDT-EC-USBX.dsl
$IASL build/ACPI/SSDT-MEM2.aml $SRCACPI/SSDT-MEM2.dsl
$IASL build/ACPI/SSDT-PLUG.aml $SRCACPI/SSDT-PLUG.dsl
$IASL build/ACPI/SSDT-PMCR.aml $SRCACPI/SSDT-PMCR.dsl
$IASL build/ACPI/SSDT-PNLF.aml $SRCACPI/SSDT-PNLF.dsl
$IASL build/ACPI/SSDT-PPMC.aml $SRCACPI/SSDT-PPMC.dsl
$IASL build/ACPI/SSDT-SBUS-MCHC.aml $SRCACPI/SSDT-SBUS-MCHC.dsl
$IASL build/ACPI/SSDT-XOSI.aml $SRCACPI/SSDT-XOSI.dsl

# Copy UEFI Drivers
cp -r src/Drivers build/Drivers

# Copy kexts
cp -r download/kexts build/Kexts

# Copy OpenCore config
cp src/config.plist build/config.plist
