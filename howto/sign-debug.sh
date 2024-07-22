#!/bin/sh
#
# this script signs an apk the way studio does (or did)
#
# WARNING use zipalign BEFORE apksigner
# BUILD_TOOLDIR="../../../build-tools/29.0.3"
# BUILD_TOOLDIR="../../../build-tools/31.0.0"
BUILD_TOOLDIR="../../../build-tools/35.0.0"

$BUILD_TOOLDIR/zipalign -f 4  bin/TopoDroidX-debug-unaligned.apk  bin/TopoDroidX-debug-aligned.apk

# sign  command
# -out  output file
# -ks   key-store
# --kd-key-alias androiddebugkey
# --ks-pass      pass:android 
$BUILD_TOOLDIR/apksigner sign --out bin/TopoDroidX-debug-keysigned.apk -ks ~/.android/debug.keystore --ks-key-alias  androiddebugkey  --ks-pass pass:android bin/TopoDroidX-debug-aligned.apk

$BUILD_TOOLDIR/apksigner verify --verbose bin/TopoDroidX-debug-keysigned.apk
# Verifies
# Verified using v1 scheme (JAR signing): true
# Verified using v2 scheme (APK Signature Scheme v2): true
# Verified using v3 scheme (APK Signature Scheme v3): true
# Number of signers: 1

