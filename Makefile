GEN=src/genwordlist
LEXFILE=lexique/Lexique381.txt
FLAGS=

default: wordlist wordlist_ascii

wordlist: wordlist_fr.txt short_wordlist_fr.txt

wordlist_ascii: wordlist_fr_ascii.txt short_wordlist_fr_ascii.txt

wordlist_alt: wordlist_fr_alt.txt short_wordlist_fr_alt.txt

wordlist_others: short_wordlist_fr_efficient.txt short_wordlist_fr_prefixe.txt \
	wordlist_fr_all.txt

all: wordlist wordlist_ascii wordlist_alt wordlist_others

wordlist_fr.txt: $(LEXFILE)
	$(GEN) $^ -o $@ $(FLAGS)

wordlist_fr_alt.txt: $(LEXFILE)
	$(GEN) -X --max-lemme-variants=3 $^ -o $@ $(FLAGS)

wordlist_fr_ascii.txt: $(LEXFILE)
	$(GEN) --char-regex=[a-z] -M9 $^ -o $@ $(FLAGS)

short_wordlist_fr.txt: $(LEXFILE)
	$(GEN) -n4 -M5 $^ -o $@ $(FLAGS)

short_wordlist_fr_alt.txt: $(LEXFILE)
	$(GEN) -n4 -M5 -X --max-lemme-variants=1 $^ -o $@ $(FLAGS)

short_wordlist_fr_ascii.txt: $(LEXFILE)
	$(GEN) -n4 -M5 --char-regex=[a-z] $^ -o $@ $(FLAGS)

short_wordlist_fr_efficient.txt: $(LEXFILE)
	$(GEN) -n4 -m2 -M4 -X --skip-cgrams='' $^ -o $@ $(FLAGS)

short_wordlist_fr_prefixe.txt: $(LEXFILE)
	$(GEN) -n4 -M10 --unique-prefix=3 $^ -o $@ $(FLAGS)

wordlist_fr_all.txt: $(LEXFILE)
	$(GEN) -n0 -m2 -M12 -X --skip-cgrams='' --char-regex="[a-zàéîôù'-]" $^ -o $@ $(FLAGS)

clean:
	rm wordlist*.txt short*wordlist*.txt