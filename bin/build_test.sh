set -x

 make clean && make allnoconfig && make -j8 && echo "make allnoconfig pass!" && make clean && make allyesconfig && make -j8 && echo "make allyesconfig pass!" && make clean && make allmodconfig && make -j8 && echo "make allmodconfig pass" 
