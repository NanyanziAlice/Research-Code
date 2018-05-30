#!/bin/sh
#
#  Name:
#     optsetup    sh function declaration of setup_options_file
#     
#  Usage: (not for interactive use. To be sourced and called as a function)
#
#     . optsetup
#     setup_options_file [<filename>]
#
#   Description:
#     When invoked without a parameter, setup_options_file generates a list
#     of options files from which to select one to be copied to the default
#     options file location and name.
#
#     When invoked with a parameter, setup_options_file copies the
#     specified file to the default options file location and name.
#
#     setup_options_file is context sensitive. When invoked from mex, it
#     uses 'mexopts.sh' as the default options file target. When invoked
#     from mbuild, it uses 'mbuildopts.sh' as the default options file
#     target. 
#
#  See Also:
#     MATLAB API Guide
#
# Copyright 1984-2011 The MathWorks, Inc.
#____________________________________________________________________________
#
#****************************************************************************
#

determine_preference_dir () { 
    REL_VERSION=`version -f`
    # set PREF_DIR to environment variable if it is set
    # <rel_version> is the base release version like R14.

    # if set but empty, use default
    PREF_DIR=${MATLAB_PREFDIR:-$HOME/.matlab/$REL_VERSION}
}

setup_describe () {

SCRIPT_NAME=`basename $arg0_`;

determine_preference_dir

cat << EOF

    Options files control which compiler to use, the compiler and link command
    options, and the runtime libraries to link against.

    Using the '$SCRIPT_NAME -setup' command selects an options file that is
    placed in $PREF_DIR and used by default for '$SCRIPT_NAME'. An options 
    file in the current working directory or specified on the command line 
    overrides the default options file in $PREF_DIR.
 
    To override the default options file, use the '$SCRIPT_NAME -f' command
    (see '$SCRIPT_NAME -help' for more information).
EOF
 
}

setup_options_file () {


    TAG="#SELECTION_TAG"
    DEFAULT_OPTIONS_FILE="mbuildopts.sh"

    #
    # Determine what script invoked this routine
    #
    SOURCE_SCRIPT=`basename $arg0_`

    #
    # if source script is MEX set the selection tag for MEX
    #
    if [ "$SOURCE_SCRIPT" = "mex" ] || [ "$SOURCE_SCRIPT" = "mexsh" ]; then 
      TAG="#SELECTION_TAG_MEX_OPT:"
      DEFAULT_OPTIONS_FILE="mexopts.sh"
    fi

    #
    # if source script is MBUILD set the selection tag for all non generic...
    #
    if [ "$SOURCE_SCRIPT" = "mbuild" ]; then 
      TAG="#SELECTION_TAG_ML_OPT:"
      DEFAULT_OPTIONS_FILE="mbuildopts.sh"
    fi

    #
    # This function is normally called by MEX/MBUILD with 0 arguments.
    # When given an input file that exists as first argument, process it
    # Second argument overrides destination
    #

    if [ "X$1" != "X" -a -f "$1" ]; then
        FOUND_FILE=$1
        OPTIONS_DEST_OVERRIDE=$2
    else

	setup_describe

	#
	# Inform the user of the available options files
	#
        echo
        echo The options files available for $SOURCE_SCRIPT are:
        echo

	#
	# For each *opt*.sh file in the options file path generate a prompt and
	# identifier for that file to be selected to copy to the default options
	# file. 
	#
	# Find *opts.sh files in the list of search directories
	#
	#  $TMW_ROOT/bin/<filename> 
	#
        file_list="`ls $TMW_ROOT/bin/*opts.sh 2> /dev/null`"

        opt_count=0
        file_array=""
        for file in $file_list ; do 
            file_comment=`egrep "^$TAG" $file | cut -f 2,3,4,5,6,7,8 -d:`
            if [ "$file_comment" != "" ]; then 
	        opt_count=`expr $opt_count + 1` ;
	        file_array="$file_array$file:"
	        echo "  $opt_count: $file : "
		echo "     $file_comment"
		echo ' '
            fi
        done
        echo
        echo "  0: Exit with no changes"
 
	#
	# Prompt user for a file selection.
	#

	if [ "$opt_count" = "0" ]; then
	    fname_number=0
        else
            temp=1
            echo
            while [ $temp -ne 0 ];
            do
              echo "Enter the number of the compiler (0-$opt_count):"
              read fname_number
              with_letters_removed=`echo $fname_number | sed -e "s/[^[:digit:]]//g"`
              if [ "$with_letters_removed" = "$fname_number" -a "$with_letters_removed" != "" ]; then

              #Using test instead of [ ] so we can discard output to stderr
                  test "$fname_number" -ge "0" -a "$fname_number" -le "$opt_count"
                  temp=$?
              fi
              if [ $temp -ne 0 ]; then
                  echo
                  echo "Please enter from 0-$opt_count"
              fi
            done
            echo
	fi
        if [ $fname_number -eq 0 ]; then
            echo "No compiler selected, no action taken."
            exit 0
        fi
	FOUND_FILE="`echo $file_array | cut -f $fname_number -d:`"
    
    fi

    #
    # Choose a destination for the options file, and copy it there.
    #

    if [ "X$OPTIONS_DEST_OVERRIDE" != "X" ]; then
        # Override destination
        echo
        echo "$FOUND_FILE is being copied to "
        echo "$OPTIONS_DEST_OVERRIDE"
        echo
        cp $FOUND_FILE $OPTIONS_DEST_OVERRIDE
    else
        #
        # Options file goes into preferences directory.
        # Create the preferences directory for the user, if it doesn't already exist.
        #
        
        determine_preference_dir

        if [ ! -d $PREF_DIR ]; then
            echo
            echo $PREF_DIR does not exist. It will be created.
            echo
            mkdir -p $PREF_DIR
        fi

        if [ -d $PREF_DIR/$DEFAULT_OPTIONS_FILE ]; then
            echo "$PREF_DIR/$DEFAULT_OPTIONS_FILE is a directory. Please remove it."
            exit 1
        fi
        if [ -f $PREF_DIR/$DEFAULT_OPTIONS_FILE ]; then
            echo "Overwrite $PREF_DIR/$DEFAULT_OPTIONS_FILE ([y]/n)? "
            read action
            if [ "$action" = "n" ]; then
                echo
                echo "Will not overwrite existing file. Options file not changed."
                echo
                exit 0
            fi
            rm -f $PREF_DIR/$DEFAULT_OPTIONS_FILE
        fi
        echo
        echo "$FOUND_FILE is being copied to "
        echo "$PREF_DIR/$DEFAULT_OPTIONS_FILE"
        echo
        cp $FOUND_FILE $PREF_DIR/$DEFAULT_OPTIONS_FILE
    fi
        
}
# end setup_options_file ()
#
