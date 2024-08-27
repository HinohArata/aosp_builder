crave run --no-patch -- "rm -rf .repo/local_manifests &&

repo init --depth=1 -u https://github.com/Arata-Stuffs/rising_manifest.git -b fourteen --git-lfs &&

git clone https://github.com/Arata-Stuffs/temporary --depth 1 -b main .repo/local_manifests &&

# Sync source rom
/opt/crave/resync.sh &&

# Set up build environment
export BUILD_USERNAME=HinohArata && 
export BUILD_HOSTNAME=crave &&
export TZ=Asia/Jakarta &&
. build/envsetup.sh &&
riseup surya user &&
make installclean && rise b"
