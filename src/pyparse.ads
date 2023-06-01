with Interfaces.C;
with Interfaces.C.Strings;

package pyparse is
   
   procedure initwords;
   pragma Export (C, initwords, "initwords");

   procedure words (WINPUT : Interfaces.C.Strings.chars_ptr);
   pragma Export (C, words, "words");

   procedure wordsfiles (INFILE : Interfaces.C.Strings.chars_ptr;
                            OUTFILE : Interfaces.C.Strings.chars_ptr);
   pragma Export (C, wordsfiles, "wordsfiles");
   
end pyparse;
