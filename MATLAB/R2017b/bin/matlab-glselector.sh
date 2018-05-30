#!/bin/sh

# Copyright 2015 The MathWorks, Inc.

# This script is undocumented and may change in the future.

if [ "$#" -ne 8 ]; then
    echo "matlab-glselector error: Expected 8 args, received "$#""
    exit 5
fi

# inputs
nodisplay=$1
noopengl=$2
jvmflag=$3
usemesa=$4
nousemesa=$5
display=$6
ARCH=$7
MATLAB=$8

# outputs
selectSWGL=0;
blacklistWarning=0;

case "$ARCH" in
    mac*)
        # MAC does not have this option
        if [ "$usemesa" = "1" ]; then
            echo "Option -softwareopengl does not apply on MAC."
        fi

        # MAC does not have this option
        if [ "$nousemesa" = "1" ]; then
            echo "Option -nosoftwareopengl does not apply on MAC."
        fi
        ;;
    *)
        # need_softwareopengl_log is log output from the need_softwareopengl
        # program below. We delete it here to clear out old results.
        need_softwareopengl_log=/tmp/matlab."$USER".need_softwareopengl.log
        rm -f "$need_softwareopengl_log"
        
        # Check if we need software OpenGL. Note that the DISPLAY variable
        # is not exported yet so we will pass it into need_softwareopengl.
        # If the display variable is empty, need_softwareopengl will use
        # the DISPLAY environment variable instead.
        # We will check the following things in this order:
        # 1. crash detector
        # 2. startup options
        # 3. settings
        # 4. bad graphics drivers
        # Even though we might not switch to software OpenGL due to bad graphics drivers
        # we still need to pass the results into MATLAB in order to get the correct
        # warning messages
        if [ "$nodisplay" = "0" -a "$noopengl" = "0" -a "$jvmflag" = "1" ] ; then
            # To avoid potential error messages that occur with certain graphics cards,
            # only run need_softwareopengl if there is a potential that we might use
            # hardware OpenGL.
            # Note: -nosoftwareopengl overrides -softwareopengl so we need to check
            #       both flags.
            if [ "$usemesa" = "0" -o "$nousemesa" = "1" ]; then
                # Return values for need_softwareopengl: 0 Do not need software OpenGL
                #                                        1 Graphics crash detected
                #                                        2 Software graphics settings
                #                                        3 Hardware graphics settings, but bad graphics driver
                #                                        4 Bad graphics driver
                $MATLAB/bin/$ARCH/need_softwareopengl $display -v > "$need_softwareopengl_log" 2>&1
                need_softwareopengl=$?;

                # Graphics crash detected
                if [ "$need_softwareopengl" = "1" ] ; then
                    selectSWGL=1;
                    blacklistWarning=0;
                # startup options: use hardware OpenGL with bad graphics driver
    	        elif [ "$nousemesa" = "1" ]; then
                    selectSWGL=0;
                    # show warning for bad graphics driver
                    if [ "$need_softwareopengl" -gt "2" ]; then
                      blacklistWarning=1;
                    fi
                # check to make sure there are no startup options for remaining cases
                elif [ "$usemesa" = "0" -a "$nousemesa" = "0" ] ; then
                    # software graphics settings
                    if [ "$need_softwareopengl" = "2" ] ; then
                        selectSWGL=1;
                        blacklistWarning=0;
                    # hardware graphics settings with bad graphics driver
                    elif [ "$need_softwareopengl" = "3" ] ; then
                        selectSWGL=0;
                        blacklistWarning=1;
                    # bad graphics driver or other crash
                    elif [ "$need_softwareopengl" -gt "3" ] ; then
                        selectSWGL=1;
                        blacklistWarning=1;
                    fi
                fi
            # The -nosoftwareopengl startup option overrides -softwareopengl
            # so we need to check both startup options
            elif [ "$usemesa" = "1" -a "$nousemesa" = "0" ]; then
                selectSWGL=1;
                blacklistWarning=0;
            fi

            if [ "$selectSWGL" = "1" ]; then
                echo "MATLAB is selecting SOFTWARE OPENGL rendering."
            fi
        else
            # Even though we should be in a no OpenGL case,
            # we should use software OpenGL if someone uses it anyway
            selectSWGL=1;
            blacklistWarning=0;
        fi
        ;;
esac

# Exit codes:
# 0: Hardware OpenGL, no warning
# 1: Hardware OpenGL, warning
# 2: Software OpenGL, no warning
# 3: Software OpenGL, warning
# 4: Incorrect values for selectSWGL or blacklistWarning
# 5: Incorrect number of arguments
if [ "$selectSWGL" -eq "0" -a "$blacklistWarning" -eq "0" ]; then
    exit 0
elif [ "$selectSWGL" -eq "0" -a "$blacklistWarning" -eq "1" ]; then
    exit 1
elif [ "$selectSWGL" -eq "1" -a "$blacklistWarning" -eq "0" ]; then
    exit 2
elif [ "$selectSWGL" -eq "1" -a "$blacklistWarning" -eq "1" ]; then
    exit 3
else
    echo "matlab-glselector Error: "$selectSWGL" "$blacklistWarning""
    exit 4
fi

