GEN=src/genwordlist
LEXFILE=lexique/Lexique381.txt
FLAGS=

default: wordlist wordlist_ascii

wordlist: wordlist_fr.txt wordlist_short_fr.txt wordlist_short_typo_fr.txt

wordlist_ascii: wordlist_fr_ascii.txt wordlist_short_fr_ascii.txt \
	wordlist_short_typo_fr_ascii.txt

wordlist_alt: wordlist_fr_alt.txt wordlist_short_fr_alt.txt

wordlist_others: wordlist_short_fr_efficient.txt wordlist_fr_8k.txt

all: wordlist wordlist_ascii wordlist_alt wordlist_others

wordlist_fr.txt: $(LEXFILE)
	$(GEN) $^ -o $@ $(FLAGS)

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

wordlist_fr_alt.txt: $(LEXFILE)
	$(GEN) -X --max-lemme-variants=3 $^ -o $@ $(FLAGS)

wordlist_short_fr_alt.txt: $(LEXFILE)
	$(GEN) -n4 -M5 -X --max-lemme-variants=1 $^ -o $@ $(FLAGS)

wordlist_short_fr_efficient.txt: $(LEXFILE)
	$(GEN) -n4 -m2 -M4 -X --skip-cgrams='' $^ -o $@ $(FLAGS)

wordlist_fr_8k.txt: $(LEXFILE)
	$(GEN) --limit=8192 --no-print-dices $^ -o $@ $(FLAGS)

clean:
	rm wordlist*.txt