# Hasher

**This repository has been superceded** by the [alphagov version](https://github.com/alphagov/verify-idp-pid-hasherator) and may be deleted in the future. Please refer to that repository directly instead.

## Introduction

Repo for a standalone app for hashing PIDs.
Many helper commands are contained within the control script in `ha.sh`.

Note that the scripts here currently assume the CSV files will have data headers in the first row of the file.
It will currently choke if the headers are not the first line.
As such, any CSV files passed to this script should be prepared such that the first row is headers.

## Hash logic

If you are here just to figure out how the hashed PIDs are calculated, the bulk of the work happens in the `src.hash_helper` module.
This should be passed the IDP entity ID and the unhashed PID.
These can be supplied either as separate strings, or as a single pre-concatenated string.
However, **the order does matter**.

## Running the Hasher

The control script's `run` argument can be passed a number of paths.
Paths should either be CSV files to hash PIDs in, or directories containing such CSVs.
In the latter case, the filesystem will be walked to discover `.csv` files.
The script will parse the headers in any discovered CSVs and interactively prompt you to choose the PID column, and either a column for the IDP ID or to supply it directly.
For example:

```
./ha.sh run path/to/csv1.csv path/to/csv2.csv ...
```

## Build

To build this repo and produce a single executable binary, run the control script's `build` task.

```
./ha.sh build
```

This currently runs the process locally - this will be improved in a future change to utilise docker for the build.

This will produce an executable in the `dist` folder of the repo.
This can be executed in a similar way to the run helper above: remember to specify the CSV file paths.

```
./dist/main path/to/csv.csv
```

## Tests

### Unit Tests

To run the unit tests, run

```
./ha.sh test
```

This builds a docker image with the test source and uses pytest to execute the tests themselves.
