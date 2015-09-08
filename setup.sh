#!/bin/sh

if [[ ! -f /Volumes/EFI/EFI/CLOVER/config.plist ]]; then
    echo "Mount EFI partition before proceeding"
else

    cd audio_CloverALC
    ./audio_cloverALC-100.sh
    cd ..

    cd audio_hdmi_8series
    unzip audio_hdmi_hd4600-hda-100_patch.command.zip
    source audio_hdmi_hd4600-hda-100_patch.command
    cd ssdt_8series
    unzip AMI-no_p0p2-HD4600-AMD-Nvidia-A1.zip
    echo "Copying ssdt to EFI"
    cp SSDT-1.aml /Volumes/EFI/EFI/CLOVER/ACPI/patched

    cd ../audio_CloverHDMI
    unzip config-hdmi_hd4600-100.plist.zip
    subl config-hdmi_hd4600-100.plist
    subl /Volumes/EFI/EFI/CLOVER/config.plist
    echo "Copy the 'kexts to patch' section into config.plist"

    cd ..
    ./ssdtPRGen.sh/ssdtPRGen.sh
    cp ~/Library/ssdtPRGen/SSDT.aml /Volumes/EFI/EFI/CLOVER/ACPI/patched

    sudo touch /System/Library/Extensions

fi