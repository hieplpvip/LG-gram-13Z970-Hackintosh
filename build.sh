#!/bin/bash

IASL='./tools/iasl -vw 3073 -vi -vr -p'
SRCACPI='src/ACPI'

rm -rf build && mkdir build

$IASL build/SSDT-DMAC.aml $SRCACPI/SSDT-DMAC.dsl
$IASL build/SSDT-EC-USBX.aml $SRCACPI/SSDT-EC-USBX.dsl
$IASL build/SSDT-MEM2.aml $SRCACPI/SSDT-MEM2.dsl
$IASL build/SSDT-PLUG.aml $SRCACPI/SSDT-PLUG.dsl
$IASL build/SSDT-PMCR.aml $SRCACPI/SSDT-PMCR.dsl
$IASL build/SSDT-PNLF.aml $SRCACPI/SSDT-PNLF.dsl
$IASL build/SSDT-PPMC.aml $SRCACPI/SSDT-PPMC.dsl
$IASL build/SSDT-SBUS-MCHC.aml $SRCACPI/SSDT-SBUS-MCHC.dsl
$IASL build/SSDT-XOSI.aml $SRCACPI/SSDT-XOSI.dsl
