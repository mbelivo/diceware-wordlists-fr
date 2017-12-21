NONASCII_FLAGS=--char-regex=[a-zàéîôùç]

.PHONY: all

all: wordlist_fr_5d_nonascii.txt wordlist_fr_4k_nonascii.txt \
	wordlist_fr_3k.txt wordlist_fr_2k.txt wordlist_fr_4d_nonascii.txt \
	wordlist_fr_4d_2_nonascii.txt wordlist_fr_4d_3.txt

wordlist_fr_5d_nonascii.txt: $(LEXFILE)
	$(GEN) -n5 -V6 $< -o $@ $(FLAGS) $(NONASCII_FLAGS)

wordlist_fr_4k_nonascii.txt: $(LEXFILE)
	$(GEN) --limit=4096 -M6 -V6 $< -o $@ $(FLAGS) $(NONASCII_FLAGS) $(NODICE_FLAGS)

wordlist_fr_3k.txt: $(LEXFILE)
	$(GEN) --limit=3072 -M6 -V5 $< -o $@ $(FLAGS) $(NODICE_FLAGS)

wordlist_fr_2k.txt: $(LEXFILE)
	$(GEN) --limit=2048 -M6 -V4 $< -o $@ $(FLAGS) $(NODICE_FLAGS)

wordlist_fr_4d_nonascii.txt: $(LEXFILE)
	$(GEN) -n4 -m2 -M5 -V4 $< -o $@ $(FLAGS) $(NONASCII_FLAGS)

wordlist_fr_4d_2_nonascii.txt: $(LEXFILE)
	$(GEN) -n4 -M9 -p3 -l3 $< -o $@ $(FLAGS) $(NONASCII_FLAGS)

wordlist_fr_4d_3.txt: $(LEXFILE)
	$(GEN) -n4 -m4 -M10 -p3 $< -o $@ $(FLAGS)

