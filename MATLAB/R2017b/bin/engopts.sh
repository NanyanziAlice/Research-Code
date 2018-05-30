#
# engopts.sh	Shell script for configuring engine standalone applications.
#               These options were tested with the specified compiler.
#
# usage:        Do not call this file directly; it is sourced by the
#               mbuild shell script.  Modify only if you don't like the
#               defaults after running mbuild.  No spaces are allowed
#               around the '=' in the variable assignment.
#
# Note: For the version of system compiler supported with this release,
#       refer to the Supported and Compatible Compiler List at:
#       http://www.mathworks.com/support/compilers/current_release/
#
#
# SELECTION_TAGs occur in template option files and are used by MATLAB
# tools, such as mex and mbuild, to determine the purpose of the contents
# of an option file. These tags are only interpreted when preceded by '#'
# and followed by ':'.
#
#SELECTION_TAG_SA_OPT: Template Options file for building standalone engine applications
#
# Copyright 1984-2008 The MathWorks, Inc.
#----------------------------------------------------------------------------
#
    if [ "$TMW_ROOT" = "" ]; then
	TMW_ROOT="$MATLAB"
    fi
    MFLAGS="-I$TMW_ROOT/extern/include"
    MLIBS="-L$TMW_ROOT/bin/$Arch -leng -lmx"
    MCXXFLAGS="-I$TMW_ROOT/extern/include/cpp $MFLAGS"
    MCXXLIBS="$MLIBS"
    LDEXTENSION=''
    case "$Arch" in
        Undetermined)
#----------------------------------------------------------------------------
# Change this line if you need to specify the location of the MATLAB
# root directory.  The mex script needs to know where to find utility
# routines so that it can determine the architecture; therefore, this
# assignment needs to be done while the architecture is still
# undetermined.
#----------------------------------------------------------------------------
            MATLAB="$MATLAB"
            ;;
        glnx86)
#----------------------------------------------------------------------------
echo "Error: Did not imbed 'options.sh' code"; exit 1 #imbed options.sh glnx86 12
#----------------------------------------------------------------------------
            ;;
        glnxa64)
#----------------------------------------------------------------------------
            RPATH="-Wl,-rpath-link,$TMW_ROOT/bin/$Arch"
            CC='gcc'
            CFLAGS='-ansi -D_GNU_SOURCE'
            CFLAGS="$CFLAGS  -fexceptions"
            CFLAGS="$CFLAGS $MFLAGS"
            CLIBS="$RPATH $MLIBS -lm"
            COPTIMFLAGS='-O -DNDEBUG'
            CDEBUGFLAGS='-g'
            CLIBS="$CLIBS -lstdc++"
#
            CXX='g++'
            CXXFLAGS='-ansi -D_GNU_SOURCE'
            CXXFLAGS="$CXXFLAGS $MCXXFLAGS -DGLNXA64 -DGCC"
            CXXLIBS="$RPATH $MCXXLIBS -lm"
            CXXOPTIMFLAGS='-O -DNDEBUG'
            CXXDEBUGFLAGS='-g'
#
#
            FC='gfortran'
            FFLAGS='-fexceptions -fbackslash'
            FFLAGS="$FFLAGS $MFLAGS"
            FLIBS="$RPATH $MLIBS -lm"
            FOPTIMFLAGS='-O'
            FDEBUGFLAGS='-g'
#
            LD="$COMPILER"
            LDFLAGS=''
            LDOPTIMFLAGS='-O'
            LDDEBUGFLAGS='-g'
#
            POSTLINK_CMDS=':'
#----------------------------------------------------------------------------
            ;;
        sol64)
#----------------------------------------------------------------------------
echo "Error: Did not imbed 'options.sh' code"; exit 1 #imbed options.sh sol64 12
#----------------------------------------------------------------------------
            ;;
        mac)
#----------------------------------------------------------------------------
echo "Error: Did not imbed 'options.sh' code"; exit 1 #imbed options.sh mac 12
#----------------------------------------------------------------------------
            ;;
        maci)
#----------------------------------------------------------------------------
echo "Error: Did not imbed 'options.sh' code"; exit 1 #imbed options.sh maci 12
#----------------------------------------------------------------------------
            ;;
        maci64)
#----------------------------------------------------------------------------
            CC='xcrun  -sdk macosx10.8  clang'
## workaround clang defect temporarily use line below           SDKROOT='/Developer/SDKs/MacOSX10.6.sdk'
# compute SDK root on the fly
# target 10.8
            MW_SDKROOT_TMP="find `xcode-select -print-path` -name MacOSX10.8.sdk"
			MW_SDKROOT=`$MW_SDKROOT_TMP`
            MACOSX_DEPLOYMENT_TARGET='10.7'
            ARCHS='x86_64'
            CFLAGS="-fno-common -arch $ARCHS -isysroot $MW_SDKROOT -mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET"
            CFLAGS="$CFLAGS  -fexceptions"
            CFLAGS="$CFLAGS $MFLAGS"
            CLIBS="$MLIBS"
            COPTIMFLAGS='-O2 -DNDEBUG'
            CDEBUGFLAGS='-g'
#
            CLIBS="$CLIBS -lc++"
            CXX='xcrun  -sdk macosx10.8  clang++'
            CXXFLAGS="-fno-common -fexceptions -arch $ARCHS -isysroot $MW_SDKROOT -mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET -std=c++11 -stdlib=libc++"
	    CXXLIBS="-lc++"
            CXXFLAGS="$CXXFLAGS $MCXXFLAGS -DMACI64"
            CXXLIBS="$CXXLIBS $MLIBS"
            CXXOPTIMFLAGS='-O2 -DNDEBUG'
            CXXDEBUGFLAGS='-g'
#
            FC='ifort'
            FFLAGS='-fexceptions -fpp -mp1 -fp-model source -assume bscc -D__LP64__'
            FFLAGS="$FFLAGS $MFLAGS"
            FC_LIBDIR="$IFORT_COMPILER14/compiler/lib"
            FLIBS="$MLIBS -L$FC_LIBDIR -lifcore -limf -lintlc -lirc -lsvml -lfor_main.o"
            FOPTIMFLAGS='-O2'
            FDEBUGFLAGS='-g'
#
            LD="$CC"
            LDFLAGS="-arch $ARCHS -Wl,-syslibroot,$MW_SDKROOT -mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET"
            LDOPTIMFLAGS='-O'
            LDDEBUGFLAGS='-g'
#
            POSTLINK_CMDS='mex_file_no_quotes="${mex_file//\"/}"'
            POSTLINK_CMDS+='; xcrun install_name_tool -change libifcore.dylib @rpath/libifcore.dylib ${mex_file_no_quotes}'
            POSTLINK_CMDS+='; xcrun install_name_tool -change libimf.dylib @rpath/libimf.dylib ${mex_file_no_quotes}'
            POSTLINK_CMDS+='; xcrun install_name_tool -change libintlc.dylib @rpath/libintlc.dylib ${mex_file_no_quotes}'
            POSTLINK_CMDS+='; xcrun install_name_tool -change libirc.dylib @rpath/libirc.dylib ${mex_file_no_quotes}'
            POSTLINK_CMDS+='; xcrun install_name_tool -change libsvml.dylib @rpath/libsvml.dylib ${mex_file_no_quotes}'
#----------------------------------------------------------------------------
            ;;
    esac
#############################################################################
#
# Architecture independent lines:
#
#     Set and uncomment any lines which will apply to all architectures.
#
#----------------------------------------------------------------------------
#           CC="$CC"
#           CFLAGS="$CFLAGS"
#           COPTIMFLAGS="$COPTIMFLAGS"
#           CDEBUGFLAGS="$CDEBUGFLAGS"
#           CLIBS="$CLIBS"
#
#           FC="$FC"
#           FFLAGS="$FFLAGS"
#           FOPTIMFLAGS="$FOPTIMFLAGS"
#           FDEBUGFLAGS="$FDEBUGFLAGS"
#           FLIBS="$FLIBS"
#
#           LD="$LD"
#           LDFLAGS="$LDFLAGS"
#           LDOPTIMFLAGS="$LDOPTIMFLAGS"
#           LDDEBUGFLAGS="$LDDEBUGFLAGS"
#           LDEXTENSION="$LDEXTENSION"
#----------------------------------------------------------------------------
#############################################################################
