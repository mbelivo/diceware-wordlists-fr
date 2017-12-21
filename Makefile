GEN=$(CURDIR)/src/genwordlist
LEXFILE=$(CURDIR)/lexique/Lexique381.txt
NODICE_FLAGS=--no-print-dices
FLAGS=-d -x $(CURDIR)/lexique/exclude_words.txt

.PHONY: wordlists extras all clean_all

export

wordlists: wordlist_fr_5d.txt wordlist_fr_4k.txt wordlist_fr_4d.txt wordlist_fr_4d_2.txt

extras:
	$(MAKE) -C extra

all: wordlists extras

wordlist_fr_5d.txt: $(LEXFILE)
	$(GEN) -n5 -M9 -V6 $< -o $@ $(FLAGS)

wordlist_fr_4k.txt: $(LEXFILE)
	$(GEN) --limit=4096 -M7 -V5 $< -o $@ $(FLAGS) $(NODICE_FLAGS)

wordlist_fr_4d.txt: $(LEXFILE)
	$(GEN) -n4 -M5 -V4 $< -o $@ $(FLAGS)

wordlist_fr_4d_2.txt: $(LEXFILE)
	$(GEN) -n4 -M10 -p3 -l3 $< -o $@ $(FLAGS)

clean_all:
	rm wordlist*.txt extra/wordlist*.txt
