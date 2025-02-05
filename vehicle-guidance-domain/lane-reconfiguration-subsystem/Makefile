# Directories
SRC_DIR := source
OUT_DIR := .

# Target PDFs
PDF_FILES := lane_reconfig_Starr.pdf lane_reconfig_xUML.pdf

# Default target (build all PDFs)
all: $(PDF_FILES)

# Explicit rule for lane_reconfig_Starr.pdf
lane_reconfig_Starr.pdf: $(SRC_DIR)/lane_reconfig.xcm $(SRC_DIR)/lane_reconfig_Starr.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/lane_reconfig.xcm -l $(SRC_DIR)/lane_reconfig_Starr.mls -d $@

# Explicit rule for lane_reconfig_xUML.pdf
lane_reconfig_xUML.pdf: $(SRC_DIR)/lane_reconfig.xcm $(SRC_DIR)/lane_reconfig_xUML.mls
	@echo "Generating $@..."
	flatland -m $(SRC_DIR)/lane_reconfig.xcm -l $(SRC_DIR)/lane_reconfig_xUML.mls -d $@

# Clean up generated PDFs
clean:
	rm -f $(PDF_FILES)