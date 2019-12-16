German slides for the presentation of the seminar "Complexity Theory" in the
winter semester 2019-2020.
Covers the NP-completeness of the Hamiltonian-Cycle problem by reduction from
Vertex Covers.

To build (requires latex, graphviz and ghostscript):

    make

To present when notes are typeset on the right screen, i.e. with 
`\setbeameroption{show notes on second screen}`:

    pdfpc -n right hamiltonian-circuits.pdf
