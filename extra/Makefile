.PHONY: all

all: wordlist_fr_8k.txt wordlist_fr_8k_nonascii.txt \
	wordlist_fr_4d_nonascii.txt wordlist_fr_4d_2_nonascii.txt wordlist_fr_4d_3.txt

wordlist_fr_8k.txt: $(LEXFILE)
	$(GEN) --limit=8192 -M9 -V7 $< -o $@ $(FLAGS) $(NODICE_FLAGS)

wordlist_fr_8k_nonascii.txt: $(LEXFILE)
	$(GEN) --limit=8192 -V7 $< -o $@ $(FLAGS) $(NONASCII_FLAGS) $(NODICE_FLAGS)

wordlist_fr_4d_nonascii.txt: $(LEXFILE)
	$(GEN) -n4 -m2 -M5 -V4 $< -o $@ $(FLAGS) $(NONASCII_FLAGS)

wordlist_fr_4d_2_nonascii.txt: $(LEXFILE)
	$(GEN) -n4 -M9 -p3 -l3 $< -o $@ $(FLAGS) $(NONASCII_FLAGS)

wordlist_fr_4d_3.txt: $(LEXFILE)
	$(GEN) -n4 -m4 -M10 -p3 $< -o $@ $(FLAGS)

