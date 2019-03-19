# Hasher

Repo for a standalone app for hashing PIDs.

## Running the Hasher

The control script's `run` argument can be passed a number of CSV files to hash PIDs in.
The script will parse the headers in the CSV and interactively prompt you to choose the PID column, and either a column for the IDP ID or to supply it directly.
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
