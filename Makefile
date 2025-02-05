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

# Filter .mls files for processing
MLS_XCM_FILES := $(filter %_Starr.mls %_xUML.mls, $(MLS_FILES))
MLS_XSM_FILES := $(filter-out %_Starr.mls %_xUML.mls, $(MLS_FILES))

# Generate correct PDF output paths (convert /source/ → / and .mls → .pdf)
PDF_XCM_FILES := $(subst /source/,/,$(MLS_XCM_FILES:%.mls=%.pdf))
PDF_XSM_FILES := $(subst /source/,/,$(MLS_XSM_FILES:%.mls=%.pdf))

# Extract the directories where PDFs will be stored
PDF_DIRS := $(sort $(dir $(PDF_XCM_FILES) $(PDF_XSM_FILES)))

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
	@echo "PDF_DIRS: $(PDF_DIRS)"

# Force execution of all rules
.PHONY: all clean debug
all: $(PDF_XCM_FILES) $(PDF_XSM_FILES)

# Ensure all directories exist before generating PDFs
$(PDF_DIRS):
	mkdir -p $@

# Rule to generate PDFs from .mls and .xcm (_Starr.mls → _Starr.pdf)
vehicle-guidance-domain/%_Starr.pdf: vehicle-guidance-domain/%/source/%_Starr.mls | $(PDF_DIRS)
	@echo "Processing _Starr: $<"
	@PREFIX=$$(basename $* | sed -E 's/_Starr//'); \
	XCM_FILE=vehicle-guidance-domain/$*/source/$${PREFIX}.xcm; \
	echo "Using XCM_FILE: $$XCM_FILE"; \
	echo "Generating PDF from XCM: $@"; \
	flatland -m $$XCM_FILE -l $< -d $@

# Rule to generate PDFs from .mls and .xcm (_xUML.mls → _xUML.pdf)
vehicle-guidance-domain/%_xUML.pdf: vehicle-guidance-domain/%/source/%_xUML.mls | $(PDF_DIRS)
	@echo "Processing _xUML: $<"
	@PREFIX=$$(basename $* | sed -E 's/_xUML//'); \
	XCM_FILE=vehicle-guidance-domain/$*/source/$${PREFIX}.xcm; \
	echo "Using XCM_FILE: $$XCM_FILE"; \
	echo "Generating PDF from XCM: $@"; \
	flatland -m $$XCM_FILE -l $< -d $@

# Rule to generate PDFs from .mls and .xsm (for non-_Starr/_xUML files only)
vehicle-guidance-domain/%.pdf: vehicle-guidance-domain/%/source/%.mls | $(PDF_DIRS)
	@echo "Processing XSM: $<"
	@PREFIX=$$(basename $*); \
	XSM_FILE=vehicle-guidance-domain/$*/source/$${PREFIX}.xsm; \
	echo "Using XSM_FILE: $$XSM_FILE"; \
	echo "Generating PDF from XSM: $@"; \
	flatland -m $$XSM_FILE -l $< -d $@

# Clean generated PDFs
clean:
	rm -f $(PDF_XCM_FILES) $(PDF_XSM_FILES)