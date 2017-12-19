GEN=$(CURDIR)/src/genwordlist
LEXFILE=$(CURDIR)/lexique/Lexique381.txt
NONASCII_FLAGS=--char-regex=[a-zàéîôùç]
NODICE_FLAGS=--no-print-dices
FLAGS=-d

.PHONY: wordlists extras all clean_all

export

wordlists: wordlist_fr_5d.txt wordlist_fr_4k.txt wordlist_fr_4d.txt wordlist_fr_4d_2.txt \
	wordlist_fr_5d_nonascii.txt wordlist_fr_4k_nonascii.txt

extras:
	$(MAKE) -C extra

all: wordlists extras

wordlist_fr_5d.txt: $(LEXFILE)
	$(GEN) -n5 -M9 -V6 $< -o $@ $(FLAGS)

wordlist_fr_5d_nonascii.txt: $(LEXFILE)
	$(GEN) -n5 -V6 $< -o $@ $(FLAGS) $(NONASCII_FLAGS)

wordlist_fr_4k.txt: $(LEXFILE)
	$(GEN) --limit=4096 -M7 -V5 $< -o $@ $(FLAGS) $(NODICE_FLAGS)

wordlist_fr_4k_nonascii.txt: $(LEXFILE)
	$(GEN) --limit=4096 -M6 -V5 $< -o $@ $(FLAGS) $(NONASCII_FLAGS) $(NODICE_FLAGS)

wordlist_fr_4d.txt: $(LEXFILE)
	$(GEN) -n4 -M5 -V4 $< -o $@ $(FLAGS)

wordlist_fr_4d_2.txt: $(LEXFILE)
	$(GEN) -n4 -M10 -p3 -l3 $< -o $@ $(FLAGS)

clean_all:
	rm wordlist*.txt extra/wordlist*.txt
