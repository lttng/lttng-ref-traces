LTTng Reference Traces
**********************

This repository contains a set of LTTng and CTF traces that can be used by
various projects for testing.

The traces can be synthetic or real-world traces and represent various
conditions. Unless specified otherwise, these traces are complete (no lost
packets or discarded events).

A description of each trace should be given in this README.

The traces are all compressed with the tar.xz format (`tar xvJf` to extract),
the archives contain a directory of the same name (without the suffix) that
contains all the trace files/folders

List of traces
==============

- `picotrace <traces/picotrace.tar.xz>`_: a tiny trace (20 events) generated
  with CTFWriter that looks like a kernel trace (except the cpu_id field is
  part of the event context).
- `16-cores-rt <traces/16-cores-rt.tar.xz>`_: a real kernel trace of 2 seconds
  recorded with LTTng 2.9.0-pre on a 16 cores server running the PREEMPT_RT
  kernel 4.1.10-rt10). No particular activity, 388738 events, 14MB.
- `basic-kernel-analysis <traces/basic-kernel-analysis.tar.xz>`_: a real kernel
  trace of ~5 seconds recorded with LTTng 2.10 on a 2 core virtual machine with
  all the events necessary to run lttnganalyses. The script to generate a
  similar trace is also provided.
