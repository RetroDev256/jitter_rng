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

### Disclaimer:

Please use battle-tested software, I provide no guaruntees whatsoever.
In the case that your computer doesn't support this high resolution timer,
the RNG may simply return 0 at all times. Beware.
