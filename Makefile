GEN=src/genwordlist
LEXFILE=lexique/Lexique381.txt
FLAGS=

default: wordlist wordlist_ascii

wordlist: wordlist_fr.txt wordlist_short_fr.txt wordlist_short_typo_fr.txt

wordlist_ascii: wordlist_fr_ascii.txt wordlist_short_fr_ascii.txt \
	wordlist_short_typo_fr_ascii.txt

wordlist_others: wordlist_short_fr_allshort.txt wordlist_fr_8k.txt

all: wordlist wordlist_ascii wordlist_others

wordlist_fr.txt: $(LEXFILE)
	$(GEN) --max-lemme-variants=12 $^ -o $@ $(FLAGS)

wordlist_short_fr.txt: $(LEXFILE)
	$(GEN) -n4 -M5 $^ -o $@ $(FLAGS)

wordlist_short_typo_fr.txt: $(LEXFILE)
	$(GEN) -n4 -M9 -p3 -l3 $^ -o $@ $(FLAGS)

wordlist_fr_ascii.txt: $(LEXFILE)
	$(GEN) -M9 --char-regex=[a-z] $^ -o $@ $(FLAGS)

wordlist_short_fr_ascii.txt: $(LEXFILE)
	$(GEN) -n4 -M5 --char-regex=[a-z] $^ -o $@ $(FLAGS)

wordlist_short_typo_fr_ascii.txt: $(LEXFILE)
	$(GEN) -n4 -M10 -p3 -l3 --char-regex=[a-z] $^ -o $@ $(FLAGS)

wordlist_short_fr_allshort.txt: $(LEXFILE)
	$(GEN) -n4 -m2 -M4 -X --skip-cgrams='' $^ -o $@ $(FLAGS)

wordlist_fr_8k.txt: $(LEXFILE)
	$(GEN) -X --limit=8192 --max-lemme-variants=5 --no-print-dices $^ -o $@ $(FLAGS)

clean:
	rm wordlist*.txt