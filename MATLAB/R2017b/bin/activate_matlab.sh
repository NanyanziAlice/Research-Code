#!/bin/sh
#
# Name:
#    activate_matlab.sh -  script file for invoking the MATLAB activation app.
#
#    Usage: activate_matlab.sh [-h|help]|"
#                              [-javadir <directory>] | [-root <directory>] |"
#                              [-test] | [-v|-verbose]"
#                              -h|-help        - Display arguments."
#                              -test           - Don't actually run the java
#                                                command (only useful with -v)."
#                              -v|-verbose     - Display settings."
#                              -javadir <directory>       - Override default java root directory."
#                              -root <directory>          - Override default MATLAB root directory."
#
#              The default settings when no override inputs are supplied are: "
#              -root = <directory containing this script>/../"
#              -javadir = <root>/sys/java/jre/$ARCH/jre'
#
#
# Copyright 2005-2017 The MathWorks, Inc.
#__________________________________________________________________________
#
    trap "exit 1" 1 2 3 15
#
#========================= java_launcher (start) ============================
#
#========================= archlist_template.sh (start) ============================
#
# usage:        archlist.sh
#
# abstract:     This Bourne Shell script creates the variable ARCH_LIST.
#
# note(s):      1. This file is always imbedded in another script
#
# Copyright 1997-2013 The MathWorks, Inc.
#----------------------------------------------------------------------------
#
    ARCH_LIST='glnxa64 maci64'
#=======================================================================
# Functions:
#   check_archlist ()
#=======================================================================
    check_archlist () { # Sets ARCH. If first argument contains a valid
			# arch then ARCH is set to that value else
		        # an empty string. If there is a second argument
			# do not output any warning message. The most
			# common forms of the first argument are:
			#
			#     ARCH=arch
			#     MATLAB_ARCH=arch
			#     argument=-arch
			#
                        # Always returns a 0 status.
                        #
                        # usage: check_archlist arch=[-]value [noprint]
                        #
	if [ $# -gt 0 ]; then
	    arch_in=`expr "$1" : '.*=\(.*\)'`
	    if [ "$arch_in" != "" ]; then
	        ARCH=`echo "$ARCH_LIST EOF $arch_in" | awk '
#-----------------------------------------------------------------------
	{ for (i = 1; i <= NF; i = i + 1)
	      if ($i == "EOF")
		  narch = i - 1
	  for (i = 1; i <= narch; i = i + 1)
		if ($i == $NF || "-" $i == $NF) {
		    print $i
		    exit
		}
	}'`
#-----------------------------------------------------------------------
	       if [ "$ARCH" = "" -a $# -eq 1 ]; then
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo ' '
echo "    Warning: $1 does not specify a valid architecture - ignored . . ."
echo ' '
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	       fi
	    else
		ARCH=""
	    fi
	else
	    ARCH=""
	fi
#
	return 0
    }
#=======================================================================
#========================= archlist_template.sh (end) ==============================
ARCH=
#========================= arch_template.sh (start) ============================
#!/bin/sh
#
# usage:        arch.sh
#
# abstract:     This Bourne Shell script determines the architecture
#               of the the current machine.
#
#               ARCH      - Machine architecture
#
#               IMPORTANT: The shell function 'check_archlist' is used
#                          by this routine and MUST be loaded first.
#                          This can be done by sourcing the file,
#
#                              archlist.sh
#
#                          before using this routine.
#
# note(s):      1. This routine must be called using a . (period)
#
#               2. Also returns ARCH_MSG which may contain additional
#                  information when ARCH returns 'unknown'.
#
# Copyright 1986-2016 The MathWorks, Inc.
#----------------------------------------------------------------------------
#
#=======================================================================
# Functions:
#   realfilepath ()
#   matlab_arch ()
#=======================================================================
    realfilepath () { # Returns the actual path in the file system
                      # of a file. It follows links. It returns an
                      # empty path if an error occurs.
                      #
                      # Returns a 1 status if the file does not exist
                      # or appears to be a circular link. Otherwise,
                      # a 0 status is returned.
                      #
                      # usage: realfilepath filepath
                      #
    filename=$1
#
# Now it is either a file or a link to a file.
#
    cpath=`pwd`

#
# Follow up to 8 links before giving up. Same as BSD 4.3
#
      n=1
      maxlinks=8
      while [ $n -le $maxlinks ]
      do
#
# Get directory correctly!
#
	newdir=`echo "$filename" | awk '
                        { tail = $0
                          np = index (tail, "/")
                          while ( np != 0 ) {
                             tail = substr (tail, np + 1, length (tail) - np)
                             if (tail == "" ) break
                             np = index (tail, "/")
                          }
                          head = substr ($0, 1, length ($0) - length (tail))
                          if ( tail == "." || tail == "..")
                             print $0
                          else
                             print head
                        }'`
	if [ ! "$newdir" ]; then
	    newdir="."
	fi
	(cd "$newdir") > /dev/null 2>&1
	if [ $? -ne 0 ]; then
	    return 1
	fi
	cd "$newdir"
#
# Need the function pwd - not the built in one
#
	newdir=`/bin/pwd`
#
	newbase=`expr //"$filename" : '.*/\(.*\)' \| "$filename"`
        lscmd=`ls -ld "$newbase" 2>/dev/null`
	if [ ! "$lscmd" ]; then
	    return 1
	fi
#
# Check for link portably
#
	if [ `expr "$lscmd" : '.*->.*'` -ne 0 ]; then
	    filename=`echo "$lscmd" | awk '{ print $NF }'`
	else
#
# It's a file
#
	    dir="$newdir"
	    command="$newbase"
#
	    cd "$dir"
#
# On Mac OS X, the -P option to pwd causes it to return a resolved path, but
# on 10.5 and later, -P is no longer the default, so we are now passing -P explicitly.
#
            if [ "$ARCH" = 'maci64' ]; then
                echo `/bin/pwd -P`/$command
#
# The Linux version of pwd returns a resolved path by default, and there is
# no -P option
#
            else
                echo `/bin/pwd`/$command
            fi
	    break
	fi
	n=`expr $n + 1`
      done
      if [ $n -gt $maxlinks ]; then
	return 1
      fi

    cd "$cpath"
    }
#
#
#=======================================================================
    matlab_arch () {  # Determine the architecture for MATLAB
                      # It returns the value in the ARCH variable.
                      # If 'unknown' is returned then sometimes a
                      # diagnostic message is returned in ARCH_MSG.
                      #
                      # Always returns a 0 status.
                      #
                      # usage: matlab_arch
                      #
        ARCH="unknown"
#
        if [ -f /bin/uname ]; then
            case "`/bin/uname`" in
                Linux)
                    case "`/bin/uname -m`" in
                        x86_64)
                            ARCH="glnxa64"
                            ;;
                    esac
                    ;;
            esac
        elif [ -f /usr/bin/uname ]; then
            case "`/usr/bin/uname`" in
                Darwin)                                 # Mac OS X
                    case "`/usr/bin/uname -p`" in
                        i386)
                            ARCH="maci64"
                            ;;
                        esac
                    ;;
            esac
        fi
        return 0
    }
#=======================================================================
#
# The local shell function check_archlist is assumed to be loaded before this
# function is sourced.
#
    ARCH_MSG=''
    check_archlist ARCH=$ARCH
    if [ "$ARCH" = "" ]; then
        if [ "$MATLAB_ARCH" != "" ]; then
            check_archlist MATLAB_ARCH=$MATLAB_ARCH
        fi
        if [ "$ARCH" = "" ]; then
            matlab_arch
        fi
    fi
    Arch=$ARCH
#========================= arch_template.sh (end) ==============================
    setMac () {
        if [ "$ARCH" = "maci" -o "$ARCH" = "maci64" ]; then
            ISMAC=1
        else
            ISMAC=0
        fi
        export ISMAC
         
    }
#=======================================================================
    setVMenvironment () {
    #   Set up some variables for the VM environment

    # Augment with AWT Motif default locale resource files
    XFILESEARCHPATH="$JRE_LOC/lib/locale/%L/%T/%N%S:$XFILESEARCHPATH"
    export XFILESEARCHPATH

    # Determine <final_load_library_path> for each platform
    #
    libraryPathsToAdd=$1
    
    case "$ARCH" in
        glnx*)
            LD_LIBRARY_PATH="`eval echo $LD_LIBRARY_PATH`"
            if [ "$LD_LIBRARY_PATH" != "" ]; then
                LD_LIBRARY_PATH="$libraryPathsToAdd":$LD_LIBRARY_PATH
            else
                LD_LIBRARY_PATH="$libraryPathsToAdd"
            fi
            export LD_LIBRARY_PATH
            ;;
        mac*)
            DYLD_LIBRARY_PATH="`eval echo $DYLD_LIBRARY_PATH`"
            if [ "$DYLD_LIBRARY_PATH" != "" ]; then
                DYLD_LIBRARY_PATH="$libraryPathsToAdd":$DYLD_LIBRARY_PATH
            else
                DYLD_LIBRARY_PATH="$libraryPathsToAdd"
            fi
            export DYLD_LIBRARY_PATH
            ;;
        *)
            LD_LIBRARY_PATH="`eval echo $LD_LIBRARY_PATH`"
            if [ "$LD_LIBRARY_PATH" != "" ]; then
                LD_LIBRARY_PATH=$LD_LIBRARY_PATH
            else
                LD_LIBRARY_PATH=
            fi
            export LD_LIBRARY_PATH
            ;;
    esac

    }
#=======================================================================
    setVMpath () {
    #
    # Determine the java vm path for each platform.
    #
    javaRoot=$1
    DEFAULT_JRE_LOC=$javaRoot/jre/$ARCH/jre

    if [ "$JRE_LOC" = "" ]; then
        JRE_LOC=$DEFAULT_JRE_LOC
    fi
#
# Look for JRE
#
    if [ ! -d "$JRE_LOC" ]; then
        echo "---------------------------------------------------------------------------"
        echo "Error: Cannot locate Java Runtime Environment (JRE)."
        echo "The directory $JRE_LOC does not exist."
        echo "---------------------------------------------------------------------------"
        exit 1
    fi
    }
#=======================================================================
getJarPaths () {
    # Get the full search path for our jar files
    # Echos the search path to stdout.

    JAR_SEARCH_PATHtmp=

    JAVA_DIR="$1/java"
    JAR_LOC="$JAVA_DIR/jar"
    JAREXT_LOC="$JAVA_DIR/jarext"

    # Get list of directories in JAR_LOC
    theDirList=`find "$JAR_LOC" -type d`
    # Add all subdirectories of JAR_LOC (including recursive search)
    for aDir in $theDirList
    do
        JAR_SEARCH_PATHtmp=$JAR_SEARCH_PATHtmp:$aDir
    done

    # Get list of directories in JAREXT_LOC
    theDirList=`find "$JAREXT_LOC" -type d`
    # Add all subdirectories of JAREXT_LOC (including recursive search)
    for aDir in $theDirList
    do
        # Do not add connector to our path since it brings in older
        # versions of some other third party classes.
        if [ "`dirname $aDir`" != "$JAREXT_LOC/connector_impl" ]; then
            JAR_SEARCH_PATHtmp=$JAR_SEARCH_PATHtmp:$aDir
        fi
    done

    JAR_SEARCH_PATHtmp=`getExtLibPaths $JAR_SEARCH_PATHtmp`

    echo $JAR_SEARCH_PATHtmp
}

getExtLibPaths () {

    JAR_SEARCH_PATHtmp=$1

    # If MW_LIB_EXT_DIRS env var set, append value to existing search path
    if [ "$MW_LIB_EXT_DIRS" != "" ]; then
        JAR_SEARCH_PATHtmp=$JAR_SEARCH_PATHtmp:$MW_LIB_EXT_DIRS
    fi

    # if we have set anything else for java.ext.dirs then we 
    # need to append the JRE location too
    if [ "$JAR_SEARCH_PATHtmp" != "" ]; then
        JAR_SEARCH_PATHtmp=$JRE_LOC/lib/ext:$JAR_SEARCH_PATHtmp
    fi

    # make sure we don't have double colons
    # OSX sed doesn't support +, manually expand it
    echo $JAR_SEARCH_PATHtmp | sed 's/::*/:/g'
}

#========================= java_launcher (end) ==============================
#========================= activation_launcher (start) ============================
#=======================================================================
    setRoot () {
#**************************************************************************
# Determine the path of the MATLAB root directory - always one directory
# up from the path to this command.
#**************************************************************************
#
    if [ "$ROOT" = "" ]; then
        cmd=`realfilepath "$1"`
        cmdDir=`dirname "$cmd"`
        actCmdDir=`(cd "$cmdDir"; pwd)`
        filePathCmdDir=`realfilepath "$actCmdDir"`
        rootDir=`(cd "$filePathCmdDir"/..; pwd)`
        ROOT=`realfilepath "$rootDir"`
    fi
    }
#========================= activation_launcher (end) ==============================
#========================= java_launcher_config (start) ============================

#=======================================================================
# Default launcher properties file relative to install root
LAUNCHER_PROPERTIES=
getDefaultLauncherConfig() {
# Find the default launcher config, if one exists (formerly java/bootstrap.properties)
    INSTROOT=$1
    CONFIG_FILE=${INSTROOT}/java/bootstrap.properties
    
    if [ -d "${INSTROOT}/java/config/default" ]; then
        FIRST_CONFIG=`find "${INSTROOT}/java/config/default" -type f -iname '[^\.]*.config' 2>/dev/null | head -n1`
        if [ -e "${FIRST_CONFIG}" ]; then
            CONFIG_FILE=${FIRST_CONFIG}
        fi
    fi
    
    echo $CONFIG_FILE
}


#=======================================================================
getJavaClasspathJar() {
    #   Find jar file for classpath.

    CLASSPATH_JAR=

    if [ -f "$LAUNCHER_PROPERTIES" ]; then
        # the additional sed command is to switch backslashes to frontslashes
        CLASSPATH_DEFINITION=`grep -i pathlistjar "$LAUNCHER_PROPERTIES" | awk -F= '{ print $2 }' | sed 's|\\\\|/|g' | sed 's/ //g'`
        if [ "$CLASSPATH_DEFINITION" != "" ]; then
            CLASSPATH_JAR=$CLASSPATH_DEFINITION
        fi
    fi

    echo $CLASSPATH_JAR
}
#=======================================================================
getIcnsLocation() {
    # return the location where the Mac icns file can be found.  
    # The location is relative to $ROOT

    LOCATION=InstallForMacOSX.app/Contents/Resources/membrane.icns

    if [ -f "$LAUNCHER_PROPERTIES" ]; then
        ICNS_DEFINITION=`grep -i icns_location "$LAUNCHER_PROPERTIES" | awk -F= '{ print $2 }'`
        if [ "$ICNS_DEFINITION" != "" ]; then
            LOCATION=$ICNS_DEFINITION
        fi
    fi

    echo $LOCATION
}
#=======================================================================
getXdocName() {
    # return the location where the Mac icns file can be found.  
    # The location is relative to $ROOT

    XDOCKNAME="Install MATLAB"

    if [ -f "$LAUNCHER_PROPERTIES" ]; then
        NAME_DEFINITION=`grep -i xdockname "$LAUNCHER_PROPERTIES" | awk -F= '{ print $2 }'`
        if [ "$NAME_DEFINITION" != "" ]; then
            XDOCNAME=$NAME_DEFINITION
        fi
    fi

    if [ $UNINSTALLING -eq 1 ]; then
        XDOCNAME="Uninstall"
    fi
    echo $XDOCNAME
}
#=======================================================================
getCopyToTempFlag() {
    # return the location where the Mac icns file can be found.  
    # The location is relative to $ROOT

    COPY_TO_TEMP=1

    if [ -f "$LAUNCHER_PROPERTIES" ]; then
        COPY_FLAG=`grep -i copyToTemp "$LAUNCHER_PROPERTIES" | awk -F= '{ print $2 }'`
        if [ "$COPY_FLAG" != "" ]; then
            COPY_TO_TEMP=$COPY_FLAG
        fi
    fi

    echo $COPY_TO_TEMP
}
#=======================================================================
getUninstallLaunchTarget () {
     # Find uninstaller main class
   
    MAIN_CLASS_OVERRIDE=
 
    if [ -f "$LAUNCHER_PROPERTIES" ]; then
        MAIN_CLASS_OVERRIDE=`grep -i uninstallmainclass "$LAUNCHER_PROPERTIES" | awk -F= '{ print $2 }' | sed 's/ //g'`
    fi

     echo $MAIN_CLASS_OVERRIDE
}
#=======================================================================
getJavaLaunchTarget () {
    #   Find jar file to execute.

    MAIN_CLASS=

    if [ -f "$LAUNCHER_PROPERTIES" ]; then
        MAIN_CLASS_OVERRIDE=`grep -i mainclass "$LAUNCHER_PROPERTIES" | grep -iv uninstall | awk -F= '{ print $2 }' | sed 's/ //g'`
        if [ "$MAIN_CLASS_OVERRIDE" != "" ]; then
            MAIN_CLASS=$MAIN_CLASS_OVERRIDE
        fi
    fi

    #   By default, set launch target to main class
    JAVA_LAUNCH_TARGETtmp=$MAIN_CLASS

    #   If MW_MAIN_CLASS env var set, set launch target to "$MW_MAIN_CLASS"
    if [ "$MW_MAIN_CLASS" != "" ]; then
        JAVA_LAUNCH_TARGETtmp=$MW_MAIN_CLASS
    fi

    echo $JAVA_LAUNCH_TARGETtmp
}
#========================= java_launcher_config (end) ==============================
#
#**************************************************************************
#
# Parse the arguments
#
    stat="OK"
    VERBOSE=0
    CLASSNAME=
    JRE_LOC=
    XTRAFLAGS=
    ROOT=
    TESTONLY=0
    arglist=
    SILENT=0
    LAUNCHER_PROPERTIES=java/config/activation/launcher.config

    while [ "$stat" = "OK" -a  $# -gt 0 ]; do
        case "$1" in
            -h|-help)
                stat=""
                ;;
            -v|-verbose)
                VERBOSE=1;
                ;;
            -javadir)
                if [ $# -eq 1 ]; then
                    echo "A JRE directory must be specified with -javadir."
                    stat=""
                else
                    shift
                    JRE_LOC=$1;

                    if [ ! -d "$JRE_LOC" ]; then
                        echo "The directory $JRE_LOC does not exist."
                        stat=""
                    fi
                    if [ ! -d "$JRE_LOC/lib" ]; then
                        echo "$JRE_LOC does not appear to be a JRE directory."
                        stat=""
                    fi
                fi
                ;;
            -root)
                if [ $# -eq 1 ]; then
                    echo "A MATLAB directory must be specified with -root."
                    stat=""
                else
                    shift
                    ROOT=$1;
                    if [ ! -d "$ROOT" ]; then
                        echo "The directory $ROOT does not exist."
                        stat=""
                    fi
                    if [ ! -f "$ROOT/bin/matlab" ]; then
                        echo "$ROOT does not appear to be a MATLAB directory."
                        stat=""
                    fi
                fi
                ;;
            -test)
                # Just run through script without actually running the java
                # command.  Only useful with -v.
                TESTONLY=1
                ;;
            -psn*)
                # Apple passes this in with things that are double clicked. Ignore.
                ;;
	    -silent)
		SILENT=1
		;;
	    -isSilent)
		SILENT=1
		;;
            -*)
		found=0
                arch=$ARCH
                check_archlist argument=$1 noprint
                if [ "$ARCH" != "" ]; then
                    found=1
                else
                    ARCH=$arch
                fi
		if [ "$found" = "0" ]; then
                    arglist="$arglist $1"
		fi
                ;;
            *)
                arglist="$arglist $1"
                ;;
        esac
        shift
    done
    setMac
#
# Check for errors
#

    if [ "$stat" != "OK" ]; then        # An error occurred.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    echo ""
    echo "   Usage: activate_matlab.sh [-h|help]|"
    echo "                             [-javadir <directory>] | [-root <directory>] |"
    echo "                             [-test] | [-v|-verbose]"
    echo ""
    echo "    -h|-help        - Display arguments."
    echo "    -test           - Don't actually run the java command (only useful with -v)."
    echo "    -v|-verbose     - Display settings."
    echo "    -javadir <directory>       - Override default java root directory."
    echo "    -root <directory>          - Override default MATLAB root directory."
    echo ""
    echo "    The default settings when no override inputs are supplied are: "
    echo "    -root = <directory containing this script>/../"
    echo '    -javadir = <root>/sys/java/jre/$ARCH/jre'
    echo ""
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        exit 1
    fi

#   Set default values for some variables if they are not set yet.
    setRoot "$0"

#   Determine the java vm path for each platform.
    setVMpath "$ROOT/sys/java"

#   Set up some variables for the VM environment.
    setVMenvironment "$ROOT/sys/os/$ARCH"

#   activation client never copies, always use $ROOT
    LAUNCHER_PROPERTIES="$ROOT/$LAUNCHER_PROPERTIES"
    if [ ! -e "$LAUNCHER_PROPERTIES" ]; then
        echo "No configuration file found at $LAUNCHER_PROPERTIES"
        exit 1
    fi

    PATHLIST_JAR=`getJavaClasspathJar "$ROOT"`
    if [ "$PATHLIST_JAR" != "" ]; then
        JAR_SEARCH_PATH=`getExtLibPaths`
        PATHLIST_JAR="$ROOT/$PATHLIST_JAR"
    else
        JAR_SEARCH_PATH=`getJarPaths "$ROOT"`
    fi

#   Get the java launch target
    JAVA_LAUNCH_TARGET=`getJavaLaunchTarget`

#   Set up java command to run.
    if [ $ISMAC -eq 1 ]; then
        XTRAFLAGS="-d64 -Xdock:name=\"Activate MATLAB\" -Xdock:icon=\"$ROOT/Activate.app/Contents/Resources/membrane.icns\""
    fi
    java_exe=$JRE_LOC/bin/java
    java_cmd="$java_exe $XTRAFLAGS"
    if [ "$JAR_SEARCH_PATH" != "" ]; then
        java_cmd="$java_cmd -Djava.ext.dirs=$JAR_SEARCH_PATH" 
    fi
    if [ "$PATHLIST_JAR" != "" ]; then
        java_cmd="$java_cmd -cp $PATHLIST_JAR"
    fi
    java_cmd="$java_cmd $JAVA_LAUNCH_TARGET -root \"$ROOT\" $arglist"
    if [ "$SILENT" = "0" ]; then
        java_cmd="$java_cmd -isStandalone"
    fi

#
    if [ "$VERBOSE" = "1" ]; then
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    echo "->  MATLABROOT          = $ROOT"
    echo "->  ARCH                = $ARCH"
    echo "->  DISPLAY             = $DISPLAY"
    echo "->  TESTONLY            = $TESTONLY"
    echo "->  JRE_LOC             = $JRE_LOC"
#
        case "$ARCH" in
            mac*)
    echo "->  DYLD_LIBRARY_PATH   = $DYLD_LIBRARY_PATH"
                ;;
            *)
    echo "->  LD_LIBRARY_PATH     = $LD_LIBRARY_PATH"
                ;;
        esac

    echo " "
    echo "Command to run:"
    echo "$java_cmd"
    echo " "
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    fi
#
#
#   Run the java command to start the activation app
    if [ "$TESTONLY" != "1" ]; then
        eval $java_cmd
    fi
