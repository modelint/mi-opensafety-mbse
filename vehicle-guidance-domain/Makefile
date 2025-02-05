# List of subsystems
SUBSYSTEMS := crosswalk-subsystem road-subsystem ego-subsystem lane-reconfiguration-subsystem intersection-subsystem

# Default target: Run `make` inside each subsystem
all:
	@for dir in $(SUBSYSTEMS); do \
		echo "Building in $$dir..."; \
		$(MAKE) -C $$dir; \
	done

# Run `make clean` inside each subsystem
clean:
	@for dir in $(SUBSYSTEMS); do \
		echo "Cleaning in $$dir..."; \
		$(MAKE) -C $$dir clean; \
	done