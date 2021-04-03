Copy all of the .ml and .mli files in this directory into your src/bin/
directory of the PS7 code. Then run:

```bash
dune exec src/bin/main.exe try name
```

to run your name translation code against all of the test cases. If a test fails,
it will print out the original source code, the result of your naming translation,
and the reference solution.

Warning: the output can be very long, so you may want to save the output to a
file by running:

```bash
dune exec src/bin/main.exe try name > output.txt
```

Then you can open the text file output.txt to more carefully examine what's
going on.
