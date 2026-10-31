.PHONY: build lint test

IVERILOG ?= iverilog
VVP ?= vvp
BUILD_DIR := build
SIM := $(BUILD_DIR)/park

build:
	@mkdir -p $(BUILD_DIR)
	$(IVERILOG) -g2012 -Wall -s park_tb -o $(SIM) park.v park_tb.v

lint: build
	@echo "Icarus warning check completed during build."

test: build
	$(VVP) $(SIM)
