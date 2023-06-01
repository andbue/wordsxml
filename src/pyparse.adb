with Ada.Text_IO; use Ada.Text_IO;
with UNCHECKED_DEALLOCATION;
with Interfaces.C.Strings;
with STRINGS_PACKAGE; use STRINGS_PACKAGE;
with CONFIG; use CONFIG;
with WORD_PARAMETERS; use WORD_PARAMETERS;
with DEVELOPER_PARAMETERS; use DEVELOPER_PARAMETERS;
with WORD_PACKAGE; use WORD_PACKAGE;
with PARSE;

package body pyparse is
    use Interfaces.C;
    use Interfaces.C.Strings;
    use type Interfaces.C.Strings.chars_ptr;

   procedure initwords is
   begin
     CONFIGURATION := DEVELOPER_VERSION;         
     SUPPRESS_PREFACE := TRUE;
     INITIALIZE_WORD_PARAMETERS;
     INITIALIZE_DEVELOPER_PARAMETERS;
     INITIALIZE_WORD_PACKAGE;
   end initwords;     
        
   procedure words(WINPUT : in chars_ptr ) is
   begin
    METHOD := COMMAND_LINE_INPUT;
    PARSE(TRIM(Value(WINPUT)));
    FLUSH(STANDARD_OUTPUT);
   end words;
   
   procedure wordsfiles(INFILE : in chars_ptr;  OUTFILE : in chars_ptr) is
   begin
    METHOD := COMMAND_LINE_FILES;
    OPEN(INPUT, IN_FILE, Value(INFILE));
    OPEN(OUTPUT, OUT_FILE, Value(OUTFILE));
    SET_OUTPUT(OUTPUT);
    SET_INPUT(INPUT);
    PARSE;
    CLOSE(OUTPUT);
    SET_OUTPUT(STANDARD_OUTPUT);
   end wordsfiles;
   
end pyparse;
