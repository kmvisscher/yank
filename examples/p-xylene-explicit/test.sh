#!/bin/bash

# Set up and run simulation in serial mode.

if [ ! -e output ]; then
    echo "Making output directory..."
    mkdir output
fi

# Clean up any leftover files
echo "Cleaning up previous simulation..."
yank cleanup --store=output

# Set up calculation.
echo "Setting up binding free energy calculation..."
yank prepare binding amber --setupdir=setup --ligname=MOL --store=output --iterations=1 --nbmethod=CutoffPerodic --temperature=300*kelvin --pressure=1*atm --verbose

# Run the simulation with verbose output:
echo "Running simulation..."
yank run --store=output --verbose

