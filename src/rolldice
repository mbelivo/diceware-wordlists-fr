#!/usr/bin/env python3

import argparse
import math
import random
import re
import sys

MIN_ENTROPY = 44


def choose(words, nb):
    rng = random.SystemRandom()

    return [rng.choice(words) for i in range(nb)]


class Wordlist():
    def __init__(self, words):
        self.words = list(words)
        self._len = len(self.words)
        self.entropy_per_word = math.log(self._len, 2)

    def __len__(self):
        return self._len

    def __getitem__(self, key):
        return self.words[key]


def wordlist_from_file(wordfile):
    is_diceware = bool(re.fullmatch('[1-6]+\s[\w \'-]+', wordfile.readline().strip()))
    wordfile.seek(0)

    if is_diceware:
        return Wordlist(word.strip().split(maxsplit=1)[1] for word in wordfile)

    return Wordlist(word.strip() for word in wordfile)


def print_passphrase(words, entropy, sep=' ', verbose=False):
    passphrase = sep.join(words)

    # entropy could be less than expected if it's really short (1-2 chars
    # words). Calculate real entropy, assuming [a-z] only words.
    entropy = min(len(passphrase) * math.log(26, 2), entropy)

    if entropy < MIN_ENTROPY:
        print('Warning: the passphrase entropy of {:2.1f} bits seems very low.'.format(entropy),
              file=sys.stderr)

    if verbose:
        print('Passphrase entropy: {:2.1f}'.format(entropy), file=sys.stderr)

    print(passphrase)


def rolldice(wordfile, entropy=None, nb_words=None):
    wordlist = wordlist_from_file(wordfile)

    if nb_words is None:
        nb_words = math.ceil(entropy / wordlist.entropy_per_word)

    entropy = nb_words * wordlist.entropy_per_word

    return choose(wordlist, nb_words), entropy


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('wordfile', type=argparse.FileType('r'))
    group = parser.add_mutually_exclusive_group()
    group.add_argument('-e', '--entropy', type=int, default=56)
    group.add_argument('nb_words', type=int, nargs='?', default=None)
    parser.add_argument('-s', '--separator', default=' ')
    parser.add_argument('-v', '--verbose', action="store_true")
    args = parser.parse_args()

    words, entropy = rolldice(args.wordfile, args.entropy, args.nb_words)

    print_passphrase(words, entropy, args.separator, args.verbose)


if __name__ == '__main__':
    main()
