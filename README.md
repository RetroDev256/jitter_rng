# Say hello to easy-peasy true random!

This library exposes a std.Random interface and jitter() function -
both will use CPU timing jitter to generate random numbers.

### How does it work?

We make the following assumptions:
- Your system has a CPU that supports high resolution timers
- Your system runs other processes at the same time as this one
- Your system has a non-deterministic CPU scheduler
- Your CPU is not some esoteric architecture

While all of these assumptions must be held to ensure current theory,
in many cases not all of them are necessary to gain true randomness.

### Disclaimer:

Please use battle-tested software, I provide no guaruntees whatsoever.
