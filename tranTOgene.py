#!/usr/bin/env python

import sys

file = open("/Users/cmdb/annotations/dmel_r6.12_trnscpt_trnspsn_ercc.fasta")


for line in file:
    line = line.rstrip( "\r\n" ).split( " " )
    if line[0].startswith(">FBti") or line[0].startswith(">ERCC"):
        trans = line[0].replace( ">", "" )
        print trans + "\t" + trans
    if line[0].startswith(">FBtr"):
        trans = line[0].replace( ">", "" )
        for field in line:
            if field.startswith("parent="):
                gene = field.replace("parent=", "").replace(";", "")
                print trans + "\t" + gene

            



