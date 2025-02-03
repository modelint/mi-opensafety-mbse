# Top-level project directory
TOP_DIR := mi-opensafety-mbse

# Subsystems
SUBSYSTEMS := crosswalk-subsystem ego-subsystem intersection-subsystem lane-reconfiguration-subsystem road-subsystem

# Directories containing model source files
MODEL_SRC_DIRS := $(addprefix vehicle-guidance-domain/, $(addsuffix /source, $(SUBSYSTEMS)))

# Find all .xcm, .xsm, and .mls files in all subsystem source directories
XCM_FILES := $(wildcard $(addsuffix /*.xcm, $(MODEL_SRC_DIRS)))
XSM_FILES := $(wildcard $(addsuffix /*.xsm, $(MODEL_SRC_DIRS)))
MLS_FILES := $(wildcard $(addsuffix /*.mls, $(MODEL_SRC_DIRS)))

# Filter .mls files
MLS_XCM_FILES := $(filter %_Starr.mls %_xUML.mls, $(MLS_FILES))
MLS_XSM_FILES := $(filter-out %_Starr.mls %_xUML.mls, $(MLS_FILES))

# Derive PDF output paths (replace "/source/" with "/")
PDF_XCM_FILES := $(MLS_XCM_FILES:$(TOP_DIR)/vehicle-guidance-domain/%_Starr.mls=$(TOP_DIR)/vehicle-guidance-domain/%.pdf)
PDF_XSM_FILES := $(MLS_XSM_FILES:$(TOP_DIR)/vehicle-guidance-domain/%.mls=$(TOP_DIR)/vehicle-guidance-domain/%.pdf)

# Debugging output
debug:
	@echo "MODEL_SRC_DIRS: $(MODEL_SRC_DIRS)"
	@echo "XCM_FILES: $(XCM_FILES)"
	@echo "XSM_FILES: $(XSM_FILES)"
	@echo "MLS_FILES: $(MLS_FILES)"
	@echo "MLS_XCM_FILES: $(MLS_XCM_FILES)"
	@echo "MLS_XSM_FILES: $(MLS_XSM_FILES)"
	@echo "PDF_XCM_FILES: $(PDF_XCM_FILES)"
	@echo "PDF_XSM_FILES: $(PDF_XSM_FILES)"

# The default target
all: debug $(PDF_XCM_FILES) $(PDF_XSM_FILES)

# Rule to generate PDFs from .mls and .xcm (for _Starr and _xUML files)
$(TOP_DIR)/vehicle-guidance-domain/%.pdf: $(TOP_DIR)/vehicle-guidance-domain/%_Starr.mls $(TOP_DIR)/vehicle-guidance-domain/%_xUML.mls | $(@D)
	@echo "Processing: $<"
	@PREFIX=$$(basename $* | sed -E 's/(_Starr|_xUML)//'); \
	XCM_FILE=$(@D)/source/$${PREFIX}.xcm; \
	echo "Using XCM_FILE: $$XCM_FILE"; \
	echo "Generating PDF from XCM: $@"; \
	if [ -f $$XCM_FILE ]; then \
		flatland -m $$XCM_FILE -l $< -d $@; \
	else \
		echo "ERROR: No matching .xcm file for $<" >&2; \
	fi

# Rule to generate PDFs from .mls and .xsm (for non-_Starr/_xUML files only)
$(TOP_DIR)/vehicle-guidance-domain/%.pdf: $(TOP_DIR)/vehicle-guidance-domain/%.mls | $(@D)
	@echo "Processing: $<"
	@PREFIX=$$(basename $*); \
	XSM_FILE=$(@D)/source/$${PREFIX}.xsm; \
	echo "Using XSM_FILE: $$XSM_FILE"; \
	echo "Generating PDF from XSM: $@"; \
	if [ -f $$XSM_FILE ]; then \
		flatland -m $$XSM_FILE -l $< -d $@; \
	else \
		echo "ERROR: No matching .xsm file for $<" >&2; \
	fi

# Ensure output directory exists
$(TOP_DIR)/vehicle-guidance-domain/%:
	mkdir -p $@

# Clean generated PDFs
clean:
	rm -f $(PDF_XCM_FILES) $(PDF_XSM_FILES)