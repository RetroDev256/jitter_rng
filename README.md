# Say hello to easy-peasy true random!

This library exposes a std.Random interface and jitter() function -
both will use CPU timing jitter to generate random numbers.

We make the following assumptions:
- Your system has a CPU that supports high resolution timers
- Your system runs other processes at the same time as this one
- Your system has a non-deterministic CPU scheduler
- Your CPU is not some esoteric architecture

While all of these assumptions must be held to ensure current theory,
in many cases not all of them are necessary to gain true randomness.

These assumptions mean that the CPU's internal timer is not tied to
the current execution of the program. External variables such as CPU
heat, the CPU frequency, the CPU scheduler, and even cache misses will
further add entropy to the timings of when instructions occur.

We harvest this entropy simply by sampling the high resolution CPU timer.

```
ramen:[retrodev]:~/repos/Zig/jitter_rng$ zig build run -Doptimize=ReleaseFast | RNG_test stdin
RNG_test using PractRand version 0.95
RNG = RNG_stdin, seed = unknown
test set = core, folding = standard(unknown format)

rng=RNG_stdin, seed=unknown
length= 2 megabytes (2^21 bytes), time= 2.1 seconds
  no anomalies in 111 test result(s)

rng=RNG_stdin, seed=unknown
length= 4 megabytes (2^22 bytes), time= 6.2 seconds
  no anomalies in 127 test result(s)

rng=RNG_stdin, seed=unknown
length= 8 megabytes (2^23 bytes), time= 12.5 seconds
  no anomalies in 139 test result(s)

rng=RNG_stdin, seed=unknown
length= 16 megabytes (2^24 bytes), time= 24.4 seconds
  no anomalies in 153 test result(s)

rng=RNG_stdin, seed=unknown
length= 32 megabytes (2^25 bytes), time= 43.6 seconds
  no anomalies in 169 test result(s)

rng=RNG_stdin, seed=unknown
length= 64 megabytes (2^26 bytes), time= 82.5 seconds
  no anomalies in 182 test result(s)

rng=RNG_stdin, seed=unknown
length= 128 megabytes (2^27 bytes), time= 160 seconds
  no anomalies in 199 test result(s)

rng=RNG_stdin, seed=unknown
length= 256 megabytes (2^28 bytes), time= 313 seconds
  no anomalies in 217 test result(s)

rng=RNG_stdin, seed=unknown
length= 512 megabytes (2^29 bytes), time= 547 seconds
  no anomalies in 232 test result(s)

... And so on ...
```

### Disclaimer:

Please use battle-tested software, I provide no guaruntees whatsoever.
