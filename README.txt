a. How to navigate your files. What files are where, and what do they do?

In our submission, we have three seperate folders for each program labelled
program1, program2, and program3. We also have an assember in the submission,
assembler.py, that takes an assembly code text file input and writes a machine
code text file. Finally, we have this README.txt file and a usage.txt that
explains how to run our assembler.py.

Inside each of the program folders, you will find the SystemVerilog modules and
some test benches (ALU_tb.sv, ProgCtr_tb.sv, TopLevel_tb.sv). Each program
folder will also have its respective assembly and machine code text files.

b. Explain which programs/features work, and which programs/features don't work.

Our ISA is able to successfully pass all 3 programs on the Sanity Checker on
GradeScope. It's able to encode message blocks (Program 1), decode and recover
original messages (Program 2), and recognize patterns (Program 3). Some
features that we wanted to implement and really take advantage of in our design
was the accumulator architecture! Our ISA takes advantage of the accumulator
register by having shorter assembly instructions (only one operand in
instruction) and it freed up more bits in our instruciton which helped us
a lot since we were restricted on 9 bits. Another feature of our ISA that
works is the LUT for storing branching addresses. By using the LUT to store
all our branching addresses, we did not have to bother doing any arithmetic
operations to calculate branch addresses, instead we could just directly go
to branch addresses through our preloaded LUT. It made things so much easier.

c. Inform us on how you distributed your work.

Darryl (Estimated Hours spent - 100):

Wrote the assembly code for all programs, revised pseudocode for
Program 2, designed all ISA operations specifications (ADD, LSRI, STR, etc.),
wrote the SystemVerilog code for all modules including the test benches, 
wrote the individual component specification for all components in the report, 
and tested the functionality of all programs in Questa. 

Muhammad Imran  (Estimated Hours spent ~ 50-60 ): wrote original load/store
ISA and assited with original pseudocode. Assisted Darryl with implementation of 
accumulator architecture. Wrote pseudocode for accumulator architecture. 
Designed diagram for CPU. Wrote SV code for modules. Wrote assembler. 

Mohammad Master (Estimated Hours spent - ):

