#!/usr/bin/env python3

import argparse, subprocess, os, re, csv, sys
from shutil import which
from enum import Enum

sp = os.path.dirname(os.path.realpath(__file__))

def decrypt(filepath: str):
    with open(filepath, 'rb') as f:
        f.seek(653)
        checksum = f.read(20).hex()


        process = subprocess.Popen(['./rcrack', 'tables', '-h', checksum], cwd=os.path.join(sp, '/app/rcrack/'), stdout=subprocess.PIPE)
        result = process.communicate()[0].decode('UTF-8')
        result = re.search(r'hex:([a-fA-F0-9]{8})', result)

        if result:
            bits = result.groups()[0]   

            return bits 
        else:
            return None

if __name__ == "__main__":


    print(decrypt(sys.argv[1]))