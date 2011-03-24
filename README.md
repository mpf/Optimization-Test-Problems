This is a repository of optimization test problems.

The AMPL problems were obtained from Robert Vanderbei's webpage:

  http://www.orfe.princeton.edu/~rvdb/ampl/nlmodels/

and many were created or translated by Hande Yurttan.

Each problem set has a file SHASUM with checksums of each test
problem. These checksums can be used to verify the integrity of the
test problems.  This file is created with the command

 shasum *.mod | awk '{printf("%-25s %s\n", $2, $1);}' > SHASUM

Changelog:
23 Mar 2011: Initial checkin, cute problems only.
