# GenerateHeaders
**GenerateHeaders** is used in order to generate header file when programmening
in C or C++. It is also able to add multiple definitions contained into C files
to the header.

## How to use?

This is very simple:

```
./genheader.sh -o test.h
```

Thanks to this command line, *genheader.sh* will be able to get all your
C files in the current working directory and add all the definitions into
a file called *test.h*. *genheader.sh* also defines the macro to define
in your header file.

There is also another way to use *genheader.sh*:

```
./genheader.sh test.c -o test.h
```

Thanks to this command line, *genheader.sh* will be able to get all
the definitions of functions contained into *test.c* and put them
into *test.h* **without removing all previous definitions**.

## Note

At the moment this project might not be able to add some functions to
the header file. This is due to the fact that the script is based on
grep and all cases had to be hardcoded into the script.


This script is not currently working with the definition of structures,
and might not be fully compatible with C++ files.


**-Dr_c0w**
