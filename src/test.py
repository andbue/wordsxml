#!/usr/bin/env python3

import os
from ctypes import cdll
from lxml import etree

class Wwords:
    """
    Access to Whitaker's Words (http://mk270.github.io/whitakers-words), xml-enabled by Alpheios:
    http://sourceforge.net/p/alpheios/code/HEAD/tarball?path=/wordsxml/trunk
    Build some ADA-Wrappers around the PARSE-Function, gnatmake -O3 -Ppyparse.
    Function "ask" returns xml-Etree of Words reply.
    Maximum input is limited to 2500 chars - maybe use another pipe for input?
    """
    def __init__(self):
        self.ada = cdll.LoadLibrary("lib/libpyparse.so")
        self.ada.initwords()

    def ask(self, latin):
        """Ask Whitaker's Words for latin word, returns xml.etree.ElementTree answer."""
        old_stdout=os.dup(1)
        pout, pin = os.pipe()
        os.dup2(pin, 1)
        self.ada.words(bytes(latin, "utf-8"))
        os.dup2(old_stdout, 1)
        with os.fdopen(pin, 'w') as pipein:
            pipein.write('\n')
        with os.fdopen(pout) as pipeout:
            ans=pipeout.read()
        os.close(old_stdout)
        words = etree.fromstring(ans)
        return words

if __name__ == "__main__":
    w = Wwords()
    res = w.ask("domini")
    print(etree.tounicode(res))

