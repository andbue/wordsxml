./make_linux.sh
mkdir obj
mkdir lib
gprbuild -P pyparse.gpr
echo G  | ../tools/Linux_x86-gcc4/makedict
echo G  | ../tools/Linux_x86-gcc4/makestem
echo G  | ../tools/Linux_x86-gcc4/makeewds
echo G  | ../tools/Linux_x86-gcc4/makeefil
../tools/Linux_x86-gcc4/makeinfl

