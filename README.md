# LG gram 13Z970 Hackintosh

| Specification       | Details                             |
----------------------|-------------------------------------|
| Model               | LG gram 13 - 2017 (13Z970)          |
| Processor           | Core i5-7200U                       |
| Integrated Graphics | Intel HD Graphics 620               |
| Memory              | 16GB RAM & 256GB SSD                |
| Sound Card          | Conexant CX8200                     |
| Wireless Card       | Intel(R) Dual Band Wireless-AC 8265 |
| SD Card Reader      | ?                                   |

## Instructions

- Follow this [guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#generate-a-new-serial) to generate a new serial number and put that in `src/smbios.txt`
- Run `./download.sh` to download necessary kernel extensions
- Run `.build.sh` to build OpenCore config and ACPI patches
