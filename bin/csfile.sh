#==========remove tmp tags=================
echo rm srouce
rm cscope.* tags
rm G*

#==========create cscope index=================
find `pwd` -name "*.h"		>  cscope.files
find `pwd` -name "*.hpp"	>> cscope.files
find `pwd` -name "*.c"		>> cscope.files
find `pwd` -name "*.cpp"	>> cscope.files
find `pwd` -name "*.java"	>> cscope.files
find `pwd` -name "*.jni"	>> cscope.files
find `pwd` -name "*.c++"	>> cscope.files
find `pwd` -name "*.hal"	>> cscope.files
find `pwd` -name "*.S"		>> cscope.files
find `pwd` -name "*.s"		>> cscope.files

cscope -bq -i cscope.files

ctags -R *

