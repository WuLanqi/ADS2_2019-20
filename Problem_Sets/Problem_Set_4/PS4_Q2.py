#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct  8 10:25:51 2019

@author: lanqi
"""

import random
def DNA(length):
    return ''.join(random.choice("A"*2+"C"*3+"G"*3+"T"*2) for _ in range(length))

print(DNA(10))
