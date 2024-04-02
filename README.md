# VHDL: Architecture naming and interpretation

Here are the architecture types:

Behavioural:

General notes:

    Traditionally no heirarchy (only one file, no components instantiated) although this varies amongst tools.
    Very quick to simulate.
    Signals behaviours are defined.
    When behavioural is used for simulation only it may contain non-synthesizable code. Behavioural intended for synthesis must naturally be synthesizable.

Xilinx specific notes

    Generally core generator models are pre-synthesis .vhd files

Structural:

General definition

    Only instantiates components and wires them together (hierarchical).
    Slower to simulate than behavioural.
    No real signal behaviour definition in top level.
    Only synthesizable code.

Xilinx xpecific notes

    Core generator models don't take timing into account.
    Generally core generator models instantiate post-synthesis netlists

The above are basically the traditional main two animals of architecture. Very commonly a "mixed" definition is used, which contains properties of both.

RTL:

RTL what is actually put on the FPGA at the end of the day. So this is synthesizable code that defines the behaviour of the system and is made up of a code hierarchy:
The bottom layers will be synthesizable behavioural, where the nitty gritty of the signal behaviour is defined, and the upper levels will be structural, where the behavioural components are tied together to create a big top level "block diagram" if you will.

On to multiple architectures:

Architectures can be all in one file or in multiple files. The only important thing is that the entity is compiled first, and that the architecture to be used is specified.

This [book: Introduction to VHDL By R.D. Hunter, T. T. Johnson](http://books.google.com.kh/books?id=jEuK71f0ouMC&printsec=frontcover) is very handy and details this kind of thing quite well.

There is no hard and fast rule about how things should be done in terms of having distinct behavioural and structural models or just mixing them. Usually in huge firmware designs (or in big corporations where code is shared and re-used) it is useful to distinguish between the two to simplify matters, however at the end of the day it comes down to whatever works for you.

### Links
 - [stackexchange answer](https://electronics.stackexchange.com/a/59384/295691)