@ECHO OFF
ECHO **********************************************************************
ECHO * I (Yufeng Gao) am NOT RESPONSIBLE for ANY DAMAGE caused by running *
ECHO * this UNOFFICIAL script on Microsoft Windows, and by using this     *
ECHO * script, you acknowledge that if you screw up your assessment(s),   *
ECHO * it's your own fault.                                               *
ECHO **********************************************************************
ECHO.

SET PATH=%PATH%;"C:\Program Files (x86)\GNU Arm Embedded Toolchain\10 2021.10\bin";"C:\Program Files\SEGGER\JLink_V814";C:\cygwin64\bin
SET SOURCELIB_ROOT=%userprofile%\Documents\csse3010\sourcelib
IF /I %0 EQU "%~dpnx0" GOTO EXECSHELL
GOTO END
:EXECSHELL
TITLE SourceLib Windows Environment
CMD /K
:END
