# data_extraction

These scripts are used for extracting interested rows from a table base on a series of key words. The usage is listed below.

Usage:

```
perl extract_rows_by_gene_id.pl -i demo_all_gene_table.txt -l demo_interested_gene_list.txt -o my_output.txt

# keep the sequence of key words as input
perl extract_rows_by_gene_id_ver2.pl -i demo_all_gene_table.txt -l demo_interested_gene_list.txt -o my_output.txt
```

### Full gene table: demo_all_gene_table

```
gene-id sample_1        sample2 sample3
AT1G01010       233     428     424
AT1G01020       204     271     687
AT1G01030       218     241     265
AT1G01040       1599    2553    2382
AT1G01050       3071    4780    6081
AT1G01060       82      160     470
AT1G01070       164     197     314
AT1G01080       3545    4635    6658
AT1G01090       10912   14764   16314
AT1G01100       14520   12556   27707
AT1G01110       152     193     311
AT1G01120       1745    1660    3691
AT1G01130       71      62      117
AT1G01140       1660    2143    2834
AT1G01150       2       11      2
AT1G01160       1181    1315    1865
AT1G01170       948     659     1677
AT1G01180       390     464     753
AT1G01190       41      75      190
AT1G01200       69      108     208
AT1G01210       490     622     927
AT1G01220       1714    2563    2828
AT1G01225       164     187     302
```

### your interested gene list: demo_interested_gene_list.txt

```
AT1G01010
AT1G01050
AT1G01080
AT1G01120
```

### Output file: my_output.txt

```
gene-id sample_1        sample2 sample3
AT1G01010       233     428     424
AT1G01050       3071    4780    6081
AT1G01080       3545    4635    6658
AT1G01120       1745    1660    3691
```
