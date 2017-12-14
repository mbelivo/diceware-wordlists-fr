GEN=src/genwordlist
LEXFILE=lexique/Lexique381.txt
FLAGS=

wordlist: wordlist_fr_5d.txt wordlist_fr_4d.txt wordlist_fr_4d_2.txt

wordlist_nonascii: wordlist_fr_5d_nonascii.txt wordlist_fr_4d_2_nonascii.txt

wordlist_nodice: wordlist_fr_4k.txt wordlist_fr_8k.txt

wordlist_nodice_nonascii: wordlist_fr_8k_nonascii.txt

all: wordlist wordlist_nonascii wordlist_nodice wordlist_nodice_nonascii

wordlist_fr_8k.txt: $(LEXFILE)
	$(GEN) -M9 -V15 --limit=8192 --no-print-dices --char-regex=[a-z] $^ -o $@ $(FLAGS)

wordlist_fr_8k_nonascii.txt: $(LEXFILE)
	$(GEN) --limit=8192 --max-lemme-variants=12 --no-print-dices $^ -o $@ $(FLAGS)

wordlist_fr_5d.txt: $(LEXFILE)
	$(GEN) -M9 -V13 -d --char-regex=[a-z] $^ -o $@ $(FLAGS)

wordlist_fr_5d_nonascii.txt: $(LEXFILE)
	$(GEN) -d --max-lemme-variants=11 $^ -o $@ $(FLAGS)

wordlist_fr_4k.txt: $(LEXFILE)
	$(GEN) -M7 -V15 --limit=4096 --no-print-dices --char-regex=[a-z] $^ -o $@ $(FLAGS)

wordlist_fr_4d.txt: $(LEXFILE)
	$(GEN) -n4 -M5 -V10 -d --char-regex=[a-z] $^ -o $@ $(FLAGS)

wordlist_fr_4d_2.txt: $(LEXFILE)
	$(GEN) -n4 -M10 -p3 -l3 -d --char-regex=[a-z] $^ -o $@ $(FLAGS)

wordlist_fr_4d_2_nonascii.txt: $(LEXFILE)
	$(GEN) -n4 -M9 -p3 -l3 -d $^ -o $@ $(FLAGS)

clean:
	rm wordlist*.txt
