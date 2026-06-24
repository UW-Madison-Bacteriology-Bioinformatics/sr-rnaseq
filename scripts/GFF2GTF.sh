#!/bin/bash
ls

REF="$1"

agat_convert_sp_gff2gtf.pl --gff ${REF}.gff -o ${REF}.gtf

ls