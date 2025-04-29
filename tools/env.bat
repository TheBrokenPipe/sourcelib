@ECHO OFF
SET PATH=%PATH%;"C:\Program Files (x86)\GNU Arm Embedded Toolchain\10 2021.10\bin";"C:\Program Files\SEGGER\JLink_V814";C:\cygwin64\bin
SET SOURCELIB_ROOT=%userprofile%\Documents\csse3010\sourcelib
SET _ARGS_=%1
SHIFT
:START
IF [%1] == [] GOTO RUN
SET _ARGS_=%_ARGS_% %1
SHIFT
GOTO START
:RUN
IF "%_ARGS_%"=="" GOTO SHELL
CMD %_ARGS_%
GOTO END
:SHELL
TITLE SourceLib Windows Environment
ECHO **********************************************************************
ECHO * I (Yufeng Gao) am NOT RESPONSIBLE for ANY DAMAGE caused by running *
ECHO * this UNOFFICIAL script on Microsoft Windows, and by using this     *
ECHO * script, you acknowledge that if you screw up your assessment(s),   *
ECHO * it's your own fault.                                               *
ECHO **********************************************************************
ECHO.
CMD /K
:END
