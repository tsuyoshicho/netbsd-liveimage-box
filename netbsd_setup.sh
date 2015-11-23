#!/bin/bash
# need remake!!
# need tools
# sed,curl,git
# packer,virtualbox,vagrant

# filename setup
VDI_FILE=test.vdi
VMDK_FILE=test.vmdk
TEMPLATE_FILE=test.ovf
RESULT_FILE=result.ovf
OVA_FILE=test.ova
ARCHIVE_FILE=test.zip

UUID_RESULT=uuid_result.txt
UUID_FILE=uuid.txt

# 1.download vdi
curl -L $URL -o $ARCHIVE_FILE

# 2.git clone for ovf template file
#git clone <url>

# 3.file name setup

# 4.uuid fixup
# replace for vid UUID(auto generate)
$VBOX_MSI_INSTALL_PATH/vboxmanage internalcommands sethduuid
$VDI_FILE > $UUID_RESULT

# split only UUID
cat uuid_result.txt | sed -e s/[^:]*: *\([0-9a-fA-F-]*\).*/\1/ >
$UUID_FILE

UUID=$(cat $UUID_FILE)

# replace for file UUID
sed -e s/UUIDREPLACE/$UUID/g $TEMPLATE_FILE > $RESULT_FILE

# rm files
rm $UUID_FILE $UUID_RESULT


# 5.buildup box(packer)
# convert vdi to vmdk
$VBOX_MSI_INSTALL_PATH/vboxmanage clonehd --format VMDK
$VDI_FILE $VMDK_FILE

# 6.push vagrant box to atlas?

