#!/usr/bin/env bash

set -ex

WORKSPACE=${WORKSPACE:-$(pwd)}

cd "$WORKSPACE"
# Set environment ============================================================
ZIP_FILTER='*'

# Download the latest sources ================================================
wget --quiet files.pharo.org/vm/src/spur/vmmaker-image.zip
wget --quiet files.pharo.org/vm/src/spur/cog.tar.gz
md5sum vmmaker-image.zip
md5sum cog.tar.gz

# Unpack sources =============================================================
tar -xzf cog.tar.gz
mkdir -p cog/build
mkdir -p cog/image

cd cog/image
unzip -o ../../vmmaker-image.zip

# Generate sources ===========================================================
cat > packaging.cs <<EOF
'From Pharo3.0 of 18 March 2013 [Latest update: #30852] on 4 August 2014 at 3:14:39.778255 pm'!

!PharoVMSpur32Builder methodsFor: 'building' stamp: 'DamienCassou 8/4/2014 15:08'!
buildSourcesForDistroPackaging
	CogNativeBoostPlugin setTargetPlatform: #Linux32PlatformId.
	
	PharoSpur32UnixConfig new
		addExternalPlugins: #( FT2Plugin SqueakSSLPlugin );
		addInternalPlugins: #( UnixOSProcessPlugin  );
		generateSources; 
		generate.
! !


!PharoVMSpur32Builder class methodsFor: 'building' stamp: 'DamienCassou 8/4/2014 15:07'!
buildSourcesForDistroPackaging
	^ self new buildSourcesForDistroPackaging! !

! !


!TPharoUnixConfig methodsFor: 'building' stamp: 'DamienCassou 8/4/2014 15:07'!
compilerFlagsRelease
  ^super compilerFlagsRelease, { '-DPRODUCTION=1' }
EOF


cat > ./script.st <<EOF
'packaging.cs' asFileReference fileIn.
PharoVMSpur32Builder buildSourcesForDistroPackaging.
Smalltalk snapshot: false andQuit: true.
EOF

wget -O- get.pharo.org/vm50 | bash
./pharo generator.image script.st || (cat stderr; exit 1)

cd ../

vm_version=$(cat build/vmVersionInfo.h | sed -e 's/^.* Date: \([-0-9]*\) .*$/\1/' | tr - .)
cd ..


# Workaround for https://pharo.fogbugz.com/f/cases/17376/CMakeLists-txt-has-hard-references
cat > cog/build/directories.cmake <<EOF
set(topDir "\${CMAKE_SOURCE_DIR}/..")
set(buildDir "\${topDir}/build")
set(thirdpartyDir "\${buildDir}/thirdParty")
set(platformsDir "\${topDir}/platforms")
set(srcDir "\${topDir}/src")
set(srcPluginsDir "\${srcDir}/plugins")
set(srcVMDir "\${srcDir}/vm")
set(platformName "unix")
set(targetPlatform \${platformsDir}/\${platformName})
set(crossDir "\${platformsDir}/Cross")
set(platformVMDir "\${targetPlatform}/vm")
set(outputDir "\${topDir}/results")
EOF

mv cog pharo-vm-spur-${vm_version}
tar cjf pharo-vm-spur-${vm_version}.tar.bz2 pharo-vm-spur-${vm_version}

md5sum pharo-vm-spur-${vm_version}.tar.bz2 > pharo-vm-spur-${vm_version}.tar.bz2.md5sum
